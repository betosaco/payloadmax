'use client'

import React, { useEffect } from 'react'
import { useFormContext, Controller } from 'react-hook-form'
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select'
import { Label } from '@/components/ui/label'
import { Input } from '@/components/ui/input'
import { Error } from '../Error'
import { Width } from '../Width'

// Componente para los campos de un socio individual
export const PartnerFields: React.FC<{
  partnerIndex: number
  isRequired: boolean
}> = ({ partnerIndex, isRequired }) => {
  const {
    register,
    formState: { errors },
    control,
    clearErrors,
    watch,
    setValue,
  } = useFormContext()

  // Prefijo para los campos de este socio
  const prefix = `partner${partnerIndex}`

  // Observar si este socio tiene algún rol ejecutivo
  const executiveRole = watch(`${prefix}ExecutiveRole`) || ''
  const hasExecutiveRole = executiveRole !== '' && executiveRole !== 'none'

  // Observar el número de socios
  const numberOfPartners = watch('numberOfPartners') || ''
  const numPartners = numberOfPartners ? parseInt(numberOfPartners, 10) : 0

  // Observar los roles ejecutivos de todos los socios
  const partnerRoles: string[] = []
  for (let i = 1; i <= 5; i++) {
    if (i !== partnerIndex && i <= numPartners) {
      const role = watch(`partner${i}ExecutiveRole`) || ''
      if (role && role !== 'none') partnerRoles.push(role)
    }
  }

  // Inicializar valor por defecto para evitar problemas
  useEffect(() => {
    const currentValue = watch(`${prefix}ExecutiveRole`)
    if (currentValue === undefined || currentValue === '') {
      setValue(`${prefix}ExecutiveRole`, 'none')
    }
  }, [prefix, setValue, watch])

  // Cuando cambia el estado de requerido, actualizar los valores
  useEffect(() => {
    if (!isRequired) {
      // Si el socio ya no es requerido, limpiamos los errores y establecemos valores por defecto
      clearErrors([
        `${prefix}FirstName`,
        `${prefix}LastName`,
        `${prefix}Nationality`,
        `${prefix}DocumentType`,
        `${prefix}DocumentNumber`,
        `${prefix}Email`,
        `${prefix}Phone`,
        `${prefix}MonetaryContribution`,
        `${prefix}Currency`,
        `${prefix}NonMonetaryDescription`,
        `${prefix}NonMonetaryValue`,
        `${prefix}NonMonetaryCurrency`,
        `${prefix}ExecutiveRole`,
      ])

      // Establecer valores por defecto para evitar nulos
      setValue(`${prefix}MonetaryContribution`, '0')
      setValue(`${prefix}Currency`, 'pen')
      setValue(`${prefix}NonMonetaryDescription`, '')
      setValue(`${prefix}NonMonetaryValue`, '0')
      setValue(`${prefix}NonMonetaryCurrency`, 'pen')
    }
  }, [isRequired, prefix, clearErrors, setValue])

  return (
    <div className="partner-fields border rounded-md p-4 mb-6">
      <h3 className="text-lg font-medium mb-4">Socio {partnerIndex}</h3>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-4 mb-6">
        <h4 className="text-md font-medium col-span-2">Información Personal</h4>

        {/* Nombre */}
        <Width width={50}>
          <Label htmlFor={`${prefix}FirstName`}>
            Nombre
            {isRequired && (
              <span className="required">
                * <span className="sr-only">(required)</span>
              </span>
            )}
          </Label>
          <Input
            id={`${prefix}FirstName`}
            type="text"
            {...register(`${prefix}FirstName`, { required: isRequired })}
          />
          {errors[`${prefix}FirstName`] && <Error />}
        </Width>

        {/* Apellido */}
        <Width width={50}>
          <Label htmlFor={`${prefix}LastName`}>
            Apellido
            {isRequired && (
              <span className="required">
                * <span className="sr-only">(required)</span>
              </span>
            )}
          </Label>
          <Input
            id={`${prefix}LastName`}
            type="text"
            {...register(`${prefix}LastName`, { required: isRequired })}
          />
          {errors[`${prefix}LastName`] && <Error />}
        </Width>

        {/* Nacionalidad */}
        <Width width={50}>
          <Label htmlFor={`${prefix}Nationality`}>
            Nacionalidad
            {isRequired && (
              <span className="required">
                * <span className="sr-only">(required)</span>
              </span>
            )}
          </Label>
          <Input
            id={`${prefix}Nationality`}
            type="text"
            {...register(`${prefix}Nationality`, { required: isRequired })}
          />
          {errors[`${prefix}Nationality`] && <Error />}
        </Width>

        {/* Tipo de Documento */}
        <Width width={50}>
          <Label htmlFor={`${prefix}DocumentType`}>
            Tipo de Documento
            {isRequired && (
              <span className="required">
                * <span className="sr-only">(required)</span>
              </span>
            )}
          </Label>
          <Controller
            control={control}
            name={`${prefix}DocumentType`}
            rules={{ required: isRequired }}
            render={({ field: { onChange, value } }) => (
              <Select onValueChange={onChange} value={value}>
                <SelectTrigger id={`${prefix}DocumentType`}>
                  <SelectValue placeholder="Seleccione tipo" />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="dni">DNI</SelectItem>
                  <SelectItem value="ce">Carnet de Extranjería</SelectItem>
                  <SelectItem value="passport">Pasaporte</SelectItem>
                </SelectContent>
              </Select>
            )}
          />
          {errors[`${prefix}DocumentType`] && <Error />}
        </Width>

        {/* Número de Documento */}
        <Width width={50}>
          <Label htmlFor={`${prefix}DocumentNumber`}>
            Número de Documento
            {isRequired && (
              <span className="required">
                * <span className="sr-only">(required)</span>
              </span>
            )}
          </Label>
          <Input
            id={`${prefix}DocumentNumber`}
            type="text"
            {...register(`${prefix}DocumentNumber`, { required: isRequired })}
          />
          {errors[`${prefix}DocumentNumber`] && <Error />}
        </Width>

        {/* Email */}
        <Width width={50}>
          <Label htmlFor={`${prefix}Email`}>
            Email
            {isRequired && (
              <span className="required">
                * <span className="sr-only">(required)</span>
              </span>
            )}
          </Label>
          <Input
            id={`${prefix}Email`}
            type="email"
            {...register(`${prefix}Email`, { required: isRequired })}
          />
          {errors[`${prefix}Email`] && <Error />}
        </Width>

        {/* Teléfono */}
        <Width width={50}>
          <Label htmlFor={`${prefix}Phone`}>
            Teléfono
            {isRequired && (
              <span className="required">
                * <span className="sr-only">(required)</span>
              </span>
            )}
          </Label>
          <Input
            id={`${prefix}Phone`}
            type="tel"
            {...register(`${prefix}Phone`, { required: isRequired })}
          />
          {errors[`${prefix}Phone`] && <Error />}
        </Width>

        {/* Campo para seleccionar el rol ejecutivo del socio (opcional) */}
        <Width width={100} className="mt-2">
          <Label htmlFor={`${prefix}ExecutiveRole`}>Rol Ejecutivo (opcional)</Label>
          <Controller
            control={control}
            name={`${prefix}ExecutiveRole`}
            render={({ field: { onChange, value } }) => (
              <Select onValueChange={onChange} value={value || ''}>
                <SelectTrigger id={`${prefix}ExecutiveRole`}>
                  <SelectValue placeholder="Seleccione rol ejecutivo (opcional)" />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="none">Ninguno</SelectItem>
                  <SelectItem value="ceo" disabled={partnerRoles.includes('ceo')}>
                    CEO (Chief Executive Officer)
                  </SelectItem>
                  <SelectItem value="coo" disabled={partnerRoles.includes('coo')}>
                    COO (Chief Operations Officer)
                  </SelectItem>
                  <SelectItem value="cfo" disabled={partnerRoles.includes('cfo')}>
                    CFO (Chief Financial Officer)
                  </SelectItem>
                  <SelectItem value="cto" disabled={partnerRoles.includes('cto')}>
                    CTO (Chief Technology Officer)
                  </SelectItem>
                  <SelectItem value="cmo" disabled={partnerRoles.includes('cmo')}>
                    CMO (Chief Marketing Officer)
                  </SelectItem>
                  <SelectItem value="chro" disabled={partnerRoles.includes('chro')}>
                    CHRO (Chief Human Resources Officer)
                  </SelectItem>
                  <SelectItem value="cio" disabled={partnerRoles.includes('cio')}>
                    CIO (Chief Information Officer)
                  </SelectItem>
                  <SelectItem value="ccpo" disabled={partnerRoles.includes('ccpo')}>
                    CCPO (Chief Customer/Product Officer)
                  </SelectItem>
                </SelectContent>
              </Select>
            )}
          />
        </Width>

        {/* Sección de contribuciones */}
        <div className="col-span-2 mt-6 pt-4 border-t border-gray-200">
          <h4 className="text-md font-medium mb-4">Contribuciones</h4>

          {/* Contribución Monetaria */}
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <Width width={50}>
              <Label htmlFor={`${prefix}MonetaryContribution`}>
                Contribución Monetaria
                {isRequired && (
                  <span className="required">
                    * <span className="sr-only">(required)</span>
                  </span>
                )}
              </Label>
              <Input
                id={`${prefix}MonetaryContribution`}
                type="text"
                inputMode="numeric"
                placeholder="0.00"
                {...register(`${prefix}MonetaryContribution`, {
                  required: isRequired,
                  setValueAs: (value) => {
                    if (!value || value === '') return isRequired ? '0' : '0'
                    const numValue = parseFloat(value.toString().replace(',', '.'))
                    return isNaN(numValue) ? '0' : numValue.toString()
                  },
                })}
              />
              {errors[`${prefix}MonetaryContribution`] && <Error />}
            </Width>

            {/* Moneda */}
            <Width width={50}>
              <Label htmlFor={`${prefix}Currency`}>
                Moneda
                {isRequired && (
                  <span className="required">
                    * <span className="sr-only">(required)</span>
                  </span>
                )}
              </Label>
              <Controller
                control={control}
                name={`${prefix}Currency`}
                rules={{ required: isRequired }}
                render={({ field: { onChange, value } }) => (
                  <Select onValueChange={onChange} value={value}>
                    <SelectTrigger id={`${prefix}Currency`}>
                      <SelectValue placeholder="Seleccione moneda" />
                    </SelectTrigger>
                    <SelectContent>
                      <SelectItem value="pen">Soles (PEN)</SelectItem>
                      <SelectItem value="usd">Dólares (USD)</SelectItem>
                    </SelectContent>
                  </Select>
                )}
              />
              {errors[`${prefix}Currency`] && <Error />}
            </Width>
          </div>

          {/* Contribución No Monetaria (opcional) */}
          <div className="mt-4">
            <h5 className="text-sm font-medium mb-2">Contribución No Monetaria (opcional)</h5>

            <Width width={100} className="mb-2">
              <Label htmlFor={`${prefix}NonMonetaryDescription`}>Descripción</Label>
              <Input
                id={`${prefix}NonMonetaryDescription`}
                type="text"
                {...register(`${prefix}NonMonetaryDescription`, {
                  setValueAs: (value) => {
                    return value || '' // Retornar string vacía en lugar de null
                  },
                })}
              />
            </Width>

            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <Width width={50}>
                <Label htmlFor={`${prefix}NonMonetaryValue`}>Valor</Label>
                <Input
                  id={`${prefix}NonMonetaryValue`}
                  type="text"
                  inputMode="numeric"
                  placeholder="0.00"
                  {...register(`${prefix}NonMonetaryValue`, {
                    setValueAs: (value) => {
                      if (!value || value === '') return '0'
                      const numValue = parseFloat(value.toString().replace(',', '.'))
                      return isNaN(numValue) ? '0' : numValue.toString()
                    },
                  })}
                />
              </Width>

              <Width width={50}>
                <Label htmlFor={`${prefix}NonMonetaryCurrency`}>Moneda</Label>
                <Controller
                  control={control}
                  name={`${prefix}NonMonetaryCurrency`}
                  render={({ field: { onChange, value } }) => (
                    <Select onValueChange={onChange} value={value}>
                      <SelectTrigger id={`${prefix}NonMonetaryCurrency`}>
                        <SelectValue placeholder="Seleccione moneda" />
                      </SelectTrigger>
                      <SelectContent>
                        <SelectItem value="pen">Soles (PEN)</SelectItem>
                        <SelectItem value="usd">Dólares (USD)</SelectItem>
                      </SelectContent>
                    </Select>
                  )}
                />
              </Width>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}

// Componente principal que maneja todos los socios
export const PartnersStep: React.FC = () => {
  const {
    watch,
    formState: { errors },
    control,
    setValue,
  } = useFormContext()

  // Obtener el número de socios seleccionado
  const numberOfPartners = watch('numberOfPartners') || ''
  const numPartners = numberOfPartners ? parseInt(numberOfPartners, 10) : 0

  // Asegurarse de que los valores numéricos se manejan correctamente
  useEffect(() => {
    // Inicializar campos de contribuciones con valores apropiados
    for (let i = 1; i <= 5; i++) {
      // Si el socio no es visible/requerido, establecer sus campos a valores por defecto
      if (i > numPartners) {
        setValue(`partner${i}MonetaryContribution`, '0') // String en lugar de null
        setValue(`partner${i}Currency`, 'pen') // Valor por defecto en lugar de null
        setValue(`partner${i}NonMonetaryDescription`, '') // String vacía en lugar de null
        setValue(`partner${i}NonMonetaryValue`, '0') // String en lugar de null
        setValue(`partner${i}NonMonetaryCurrency`, 'pen') // Valor por defecto en lugar de null
        setValue(`partner${i}ExecutiveRole`, 'none')
      }
    }
  }, [numPartners, setValue])

  return (
    <div className="partners-step">
      {/* Selector de número de socios */}
      <Width width={100}>
        <Label htmlFor="numberOfPartners">
          Número de Socios
          <span className="required">
            * <span className="sr-only">(required)</span>
          </span>
        </Label>
        <Controller
          control={control}
          name="numberOfPartners"
          rules={{ required: true }}
          render={({ field: { onChange, value } }) => (
            <Select onValueChange={onChange} value={value || ''}>
              <SelectTrigger id="numberOfPartners">
                <SelectValue placeholder="Seleccione cantidad de socios" />
              </SelectTrigger>
              <SelectContent>
                <SelectItem value="2">2 socios</SelectItem>
                <SelectItem value="3">3 socios</SelectItem>
                <SelectItem value="4">4 socios</SelectItem>
                <SelectItem value="5">5 socios</SelectItem>
              </SelectContent>
            </Select>
          )}
        />
        {errors.numberOfPartners && <Error />}
      </Width>

      {numberOfPartners && (
        <div className="mt-6">
          <p className="text-sm text-gray-500 mb-4">
            Por favor ingrese los datos de cada socio incluyendo sus contribuciones.{' '}
            {numPartners > 2 ? `Ha seleccionado ${numPartners} socios.` : ''}
          </p>

          {/* Renderizar campos para cada socio */}
          {[1, 2, 3, 4, 5].map((index) => {
            // Solo mostrar socios según el número seleccionado
            if (index <= numPartners) {
              return (
                <PartnerFields key={`partner-${index}`} partnerIndex={index} isRequired={true} />
              )
            }
            return null
          })}
        </div>
      )}
    </div>
  )
}
