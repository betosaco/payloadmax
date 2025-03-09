'use client'
import type { FormFieldBlock, Form as FormType } from '@payloadcms/plugin-form-builder/types'
import type { FieldErrorsImpl, UseFormRegister, Control } from 'react-hook-form'

import { useRouter } from 'next/navigation'
import React, { useCallback, useState, useEffect } from 'react'
import { useForm, FormProvider } from 'react-hook-form'
import RichText from '@/components/RichText'
import { Button } from '@/components/ui/button'
import type { SerializedEditorState } from '@payloadcms/richtext-lexical/lexical'

import { fields } from './fields'
import { getClientSideURL } from '@/utilities/getURL'
import { PartnersStep } from './PartnerFields'
import { CEOSelection } from './CEOSelection'

export type FormBlockType = {
  blockName?: string
  blockType?: 'formBlock'
  enableIntro: boolean
  form: FormType
  introContent?: SerializedEditorState
  backgroundColor?:
    | 'transparent'
    | 'white'
    | 'gray-50'
    | 'gray-100'
    | 'cream'
    | 'beige'
    | 'blue-50'
    | 'blue-100'
    | 'green-50'
    | 'green-100'
    | 'pink-50'
    | 'purple-50'
    | 'yellow-50'
  className?: string
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

// Definir tipos específicos para propósitos de tipado
type FieldComponent = React.ComponentType<{
  form: FormType
  control: Control<FormFieldBlock[]>
  errors: Partial<FieldErrorsImpl<FormFieldBlock[]>>
  register: UseFormRegister<FormFieldBlock[]>
  [key: string]: unknown
}>

type FieldsMap = Record<string, FieldComponent>

type StepData = {
  title: string
  fields?: { fieldName: string }[]
  isPartnersStep?: boolean
  isCEOStep?: boolean
}

// Simplificar la función isPartnersStep con tipos específicos
function isPartnersStep(stepData: StepData | undefined): boolean {
  if (!stepData) return false

  // Verificar primero si el paso tiene la propiedad isPartnersStep explícita
  if (stepData.isPartnersStep === true) return true

  // Si no tiene la propiedad, verificar los campos
  if (!Array.isArray(stepData.fields)) return false

  return stepData.fields.some(
    (field) =>
      field.fieldName === 'numberOfPartners' ||
      (field.fieldName && field.fieldName.startsWith('partner')),
  )
}

// Función para detectar el paso de selección de CEO
function isCEOStep(stepData: StepData | undefined): boolean {
  if (!stepData) return false

  // Verificar primero si el paso tiene la propiedad isCEOStep explícita
  if (stepData.isCEOStep === true) return true

  // Si no tiene la propiedad, verificar los campos
  if (!Array.isArray(stepData.fields)) return false

  return stepData.fields.some(
    (field) =>
      field.fieldName === 'ceoSelection' ||
      (field.fieldName && field.fieldName.startsWith('newCEO')),
  )
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
    backgroundColor = 'white',
    className,
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
            const typedField = field as FormFieldBlock
            const fieldIdentifier =
              'name' in typedField
                ? (typedField.name as string)
                : 'blockName' in typedField
                  ? (typedField.blockName as string)
                  : undefined
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

  // Obtener los campos para el paso actual
  const currentStepFields = getFieldsForCurrentStep()

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
      <div
        className={`p-4 lg:p-8 border border-border rounded-[0.8rem] shadow-sm ${
          backgroundColor === 'transparent'
            ? 'bg-transparent'
            : backgroundColor === 'white'
              ? 'bg-white text-gray-900 dark:text-gray-900'
              : backgroundColor === 'gray-50'
                ? 'bg-gray-50 text-gray-900 dark:text-gray-900'
                : backgroundColor === 'gray-100'
                  ? 'bg-gray-100 text-gray-900 dark:text-gray-900'
                  : backgroundColor === 'cream'
                    ? 'bg-amber-50 text-gray-900 dark:text-gray-900'
                    : backgroundColor === 'beige'
                      ? 'bg-amber-100 text-gray-900 dark:text-gray-900'
                      : backgroundColor === 'blue-50'
                        ? 'bg-blue-50 text-gray-900 dark:text-gray-900'
                        : backgroundColor === 'blue-100'
                          ? 'bg-blue-100 text-gray-900 dark:text-gray-900'
                          : backgroundColor === 'green-50'
                            ? 'bg-green-50 text-gray-900 dark:text-gray-900'
                            : backgroundColor === 'green-100'
                              ? 'bg-green-100 text-gray-900 dark:text-gray-900'
                              : backgroundColor === 'pink-50'
                                ? 'bg-pink-50 text-gray-900 dark:text-gray-900'
                                : backgroundColor === 'purple-50'
                                  ? 'bg-purple-50 text-gray-900 dark:text-gray-900'
                                  : backgroundColor === 'yellow-50'
                                    ? 'bg-yellow-50 text-gray-900 dark:text-gray-900'
                                    : 'bg-white text-gray-900 dark:text-gray-900'
        } ${className || ''}`}
      >
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
                {isMultiStep && currentStep < totalSteps && steps && (
                  <div className="form-steps-indicator mb-6">
                    <p className="text-sm text-gray-500 mb-2">
                      Paso {currentStep + 1} de {totalSteps} -{' '}
                      {steps[currentStep]?.title || 'Paso sin título'}
                    </p>
                    <div className="w-full bg-gray-200 rounded-full h-2.5">
                      <div
                        className="bg-blue-600 h-2.5 rounded-full"
                        style={{ width: `${((currentStep + 1) / totalSteps) * 100}%` }}
                      ></div>
                    </div>
                  </div>
                )}

                {/* Verificar si estamos en el paso de socios */}
                {isMultiStep &&
                currentStepFields &&
                steps &&
                currentStep < steps.length &&
                steps[currentStep] ? (
                  // Verificar si es el paso de socios o CEO
                  isPartnersStep(steps[currentStep]) ? (
                    <PartnersStep />
                  ) : isCEOStep(steps[currentStep]) ? (
                    <CEOSelection />
                  ) : (
                    // Renderizado de campos normales
                    <div className="form-fields">
                      {currentStepFields.map((field: FormFieldBlock, index: number) => {
                        // Acceso seguro simplificado
                        const blockType = field?.blockType as string
                        const fieldsMap = fields as unknown as FieldsMap
                        if (!blockType || !fieldsMap[blockType]) return null

                        const FieldComponent = fieldsMap[blockType]
                        return (
                          <React.Fragment key={index}>
                            <FieldComponent
                              form={formFromProps}
                              {...field}
                              control={control}
                              errors={errors}
                              register={register}
                            />
                          </React.Fragment>
                        )
                      })}
                    </div>
                  )
                ) : (
                  // Renderizado para formulario sin multi-paso
                  <div className="form-fields">
                    {currentStepFields &&
                      currentStepFields.map((field: FormFieldBlock, index: number) => {
                        const blockType = field?.blockType as string
                        const fieldsMap = fields as unknown as FieldsMap
                        if (!blockType || !fieldsMap[blockType]) return null

                        const FieldComponent = fieldsMap[blockType]
                        return (
                          <React.Fragment key={index}>
                            <FieldComponent
                              form={formFromProps}
                              {...field}
                              control={control}
                              errors={errors}
                              register={register}
                            />
                          </React.Fragment>
                        )
                      })}
                  </div>
                )}
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
