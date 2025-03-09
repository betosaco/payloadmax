'use client'
import type { FormFieldBlock, Form as FormType } from '@payloadcms/plugin-form-builder/types'

import { useRouter } from 'next/navigation'
import React, { useCallback, useState, useEffect } from 'react'
import { useForm, FormProvider } from 'react-hook-form'
import RichText from '@/components/RichText'
import { Button } from '@/components/ui/button'
import type { SerializedEditorState } from '@payloadcms/richtext-lexical/lexical'

import { fields } from './fields'
import { getClientSideURL } from '@/utilities/getURL'

export type FormBlockType = {
  blockName?: string
  blockType?: 'formBlock'
  enableIntro: boolean
  form: FormType
  introContent?: SerializedEditorState
  multiStep?: {
    enabled: boolean
    steps?: {
      title: string
      fields: {
        fieldName: string
      }[]
    }[]
  }
}

export const FormBlock: React.FC<
  {
    id?: string
  } & FormBlockType
> = (props) => {
  const {
    enableIntro,
    form: formFromProps,
    form: { id: formID, confirmationMessage, confirmationType, redirect, submitButtonLabel } = {},
    introContent,
    multiStep,
  } = props

  const formMethods = useForm({
    defaultValues: formFromProps.fields,
  })
  const {
    control,
    formState: { errors },
    handleSubmit,
    register,
  } = formMethods

  const [isLoading, setIsLoading] = useState(false)
  const [hasSubmitted, setHasSubmitted] = useState<boolean>()
  const [error, setError] = useState<{ message: string; status?: string } | undefined>()
  const [currentStep, setCurrentStep] = useState(0)
  const router = useRouter()

  // Check if the form is multi-step and has valid steps
  // Usamos verificaciones de seguridad adicionales para manejar posibles errores de base de datos
  const isMultiStepEnabled = multiStep?.enabled === true
  const hasValidSteps = Array.isArray(multiStep?.steps) && multiStep.steps.length > 0
  const isMultiStep = isMultiStepEnabled && hasValidSteps

  // Si no hay pasos válidos, tratamos como un formulario normal
  const steps = isMultiStep ? multiStep.steps : null
  const totalSteps = steps?.length || 1

  // Si estamos en paso mayor al número de pasos, restablecemos al último paso
  // Esto previene errores si la configuración cambia
  useEffect(() => {
    if (steps && currentStep >= steps.length) {
      setCurrentStep(Math.max(0, steps.length - 1))
    }
  }, [steps, currentStep])

  // Get fields for the current step if using multi-step, otherwise use all fields
  const getFieldsForCurrentStep = useCallback(() => {
    // Si no es multi-step o hay algún problema con los pasos, devolvemos todos los campos
    if (!isMultiStep || !steps || !Array.isArray(formFromProps.fields)) {
      return formFromProps.fields || []
    }

    // Protección contra índices fuera de rango
    const stepIndex = Math.min(currentStep, steps.length - 1)
    const currentStepData = steps[stepIndex]

    if (!currentStepData || !Array.isArray(currentStepData.fields)) {
      return formFromProps.fields || []
    }

    try {
      // Get field names from the current step
      const fieldNames = currentStepData.fields.map((field) => field.fieldName).filter(Boolean)

      // Si no hay nombres de campo válidos, mostramos todos los campos
      if (fieldNames.length === 0) {
        return formFromProps.fields
      }

      // Filter form fields to only include those in the current step
      return (
        formFromProps.fields.filter((field) => {
          try {
            // Para manejar diferentes tipos de campos, verificamos si tienen una propiedad 'name' o 'blockName'
            const fieldIdentifier = (field as any).name || (field as any).blockName
            return fieldIdentifier && fieldNames.includes(fieldIdentifier)
          } catch (err) {
            console.warn('Error al filtrar campo:', err)
            return true // Incluir el campo si hay un error al procesarlo
          }
        }) || []
      )
    } catch (err) {
      console.warn('Error en getFieldsForCurrentStep:', err)
      return formFromProps.fields || [] // En caso de error, mostrar todos los campos
    }
  }, [formFromProps.fields, isMultiStep, steps, currentStep])

  const onSubmit = useCallback(
    (data: FormFieldBlock[]) => {
      // If using multi-step form and not on the last step, go to next step
      if (isMultiStep && currentStep < totalSteps - 1) {
        setCurrentStep((prevStep) => prevStep + 1)
        return
      }

      let loadingTimerID: ReturnType<typeof setTimeout>
      const submitForm = async () => {
        setError(undefined)

        const dataToSend = Object.entries(data).map(([name, value]) => ({
          field: name,
          value,
        }))

        // delay loading indicator by 1s
        loadingTimerID = setTimeout(() => {
          setIsLoading(true)
        }, 1000)

        try {
          const req = await fetch(`${getClientSideURL()}/api/form-submissions`, {
            body: JSON.stringify({
              form: formID,
              submissionData: dataToSend,
            }),
            headers: {
              'Content-Type': 'application/json',
            },
            method: 'POST',
          })

          const res = await req.json()

          clearTimeout(loadingTimerID)

          if (req.status >= 400) {
            setIsLoading(false)

            setError({
              message: res.errors?.[0]?.message || 'Internal Server Error',
              status: res.status,
            })

            return
          }

          setIsLoading(false)
          setHasSubmitted(true)

          if (confirmationType === 'redirect' && redirect) {
            const { url } = redirect

            const redirectUrl = url

            if (redirectUrl) router.push(redirectUrl)
          }
        } catch (err) {
          console.warn(err)
          setIsLoading(false)
          setError({
            message: 'Something went wrong.',
          })
        }
      }

      void submitForm()
    },
    [router, formID, redirect, confirmationType, isMultiStep, currentStep, totalSteps],
  )

  const handlePrevStep = useCallback(() => {
    if (currentStep > 0) {
      setCurrentStep((prevStep) => prevStep - 1)
    }
  }, [currentStep])

  return (
    <div className="w-full max-w-4xl mx-auto px-4 my-12">
      {enableIntro && introContent && !hasSubmitted && (
        <RichText className="mb-8 lg:mb-12" data={introContent} enableGutter={false} />
      )}
      <div className="p-4 lg:p-8 border border-border rounded-[0.8rem] bg-white shadow-sm">
        <FormProvider {...formMethods}>
          {!isLoading && hasSubmitted && confirmationType === 'message' && (
            <RichText data={confirmationMessage} />
          )}
          {isLoading && !hasSubmitted && <p>Loading, please wait...</p>}
          {error && (
            <div className="p-4 text-red-600 bg-red-50 rounded mb-4">{`${error.status || '500'}: ${error.message || ''}`}</div>
          )}
          {!hasSubmitted && (
            <form id={formID} onSubmit={handleSubmit(onSubmit)}>
              {/* Display step title if using multi-step form */}
              {isMultiStep && steps && steps[currentStep] && (
                <div className="mb-6">
                  <h3 className="text-xl font-medium">{steps[currentStep].title}</h3>
                  {/* Optional: Add step indicator */}
                  <div className="mt-2 text-sm text-muted-foreground">
                    Step {currentStep + 1} of {totalSteps}
                  </div>
                </div>
              )}

              <div className="mb-4 last:mb-0">
                {formFromProps &&
                  formFromProps.fields &&
                  getFieldsForCurrentStep()?.map((field, index) => {
                    // eslint-disable-next-line @typescript-eslint/no-explicit-any
                    const Field: React.FC<any> = fields?.[field.blockType as keyof typeof fields]
                    if (Field) {
                      return (
                        <div className="mb-6 last:mb-0" key={index}>
                          <Field
                            form={formFromProps}
                            {...field}
                            {...formMethods}
                            control={control}
                            errors={errors}
                            register={register}
                          />
                        </div>
                      )
                    }
                    return null
                  })}
              </div>

              <div className="flex justify-between">
                {/* Show back button if on steps after the first one */}
                {isMultiStep && currentStep > 0 && (
                  <Button type="button" variant="outline" onClick={handlePrevStep}>
                    Back
                  </Button>
                )}

                <Button
                  form={formID}
                  type="submit"
                  variant="default"
                  className={isMultiStep && currentStep > 0 ? 'ml-auto' : ''}
                >
                  {isMultiStep && currentStep < totalSteps - 1 ? 'Next' : submitButtonLabel}
                </Button>
              </div>
            </form>
          )}
        </FormProvider>
      </div>
    </div>
  )
}
