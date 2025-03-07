'use client'
import type { FormFieldBlock, Form as FormType } from '@payloadcms/plugin-form-builder/types'

import { useRouter } from 'next/navigation'
import React, { useCallback, useState } from 'react'
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
  const isMultiStep = multiStep?.enabled && multiStep.steps && multiStep.steps.length > 0
  const steps = isMultiStep ? multiStep.steps : null
  const totalSteps = steps?.length || 1

  // Get fields for the current step if using multi-step, otherwise use all fields
  const getFieldsForCurrentStep = useCallback(() => {
    if (!isMultiStep || !steps) {
      return formFromProps.fields
    }

    const currentStepData = steps[currentStep]
    if (!currentStepData || !currentStepData.fields) {
      return formFromProps.fields
    }

    // Get field names from the current step
    const fieldNames = currentStepData.fields.map((field) => field.fieldName)

    // Filter form fields to only include those in the current step
    return (
      formFromProps.fields?.filter((field) => {
        // Para manejar diferentes tipos de campos, verificamos si tienen una propiedad 'name' o 'blockName'
        const fieldIdentifier = (field as any).name || (field as any).blockName
        return fieldIdentifier && fieldNames.includes(fieldIdentifier)
      }) || []
    )
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
    <div className="lg:max-w-[48rem]">
      {enableIntro && introContent && !hasSubmitted && (
        <RichText className="mb-8 lg:mb-12" data={introContent} enableGutter={false} />
      )}
      <div className="p-4 lg:p-6 border border-border rounded-[0.8rem]">
        <FormProvider {...formMethods}>
          {!isLoading && hasSubmitted && confirmationType === 'message' && (
            <RichText data={confirmationMessage} />
          )}
          {isLoading && !hasSubmitted && <p>Loading, please wait...</p>}
          {error && <div>{`${error.status || '500'}: ${error.message || ''}`}</div>}
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
