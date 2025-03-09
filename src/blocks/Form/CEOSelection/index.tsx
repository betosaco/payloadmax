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

export const CEOSelection: React.FC = () => {
  const {
    register,
    watch,
    setValue,
    formState: { errors },
    control,
    clearErrors,
  } = useFormContext()

  // Observar el campo de selección de CEO y los campos de socios con rol ejecutivo
  const ceoSelection = watch('ceoSelection') || ''
  const partner1Role = watch('partner1ExecutiveRole') || 'none'
  const partner2Role = watch('partner2ExecutiveRole') || 'none'
  const partner3Role = watch('partner3ExecutiveRole') || 'none'
  const partner4Role = watch('partner4ExecutiveRole') || 'none'
  const partner5Role = watch('partner5ExecutiveRole') || 'none'

  // Determinar qué socios son CEO
  const partner1IsCEO = partner1Role === 'ceo'
  const partner2IsCEO = partner2Role === 'ceo'
  const partner3IsCEO = partner3Role === 'ceo'
  const partner4IsCEO = partner4Role === 'ceo'
  const partner5IsCEO = partner5Role === 'ceo'

  // Observar información relevante de los socios
  const numberOfPartners = watch('numberOfPartners') || ''
  const numPartners = numberOfPartners ? parseInt(numberOfPartners, 10) : 0

  // Actualizar automáticamente la selección de CEO basado en los socios con rol CEO
  useEffect(() => {
    // Si algún socio está marcado como CEO, seleccionarlo automáticamente
    if (partner1IsCEO) {
      setValue('ceoSelection', 'partner1')
    } else if (partner2IsCEO) {
      setValue('ceoSelection', 'partner2')
    } else if (partner3IsCEO && numPartners >= 3) {
      setValue('ceoSelection', 'partner3')
    } else if (partner4IsCEO && numPartners >= 4) {
      setValue('ceoSelection', 'partner4')
    } else if (partner5IsCEO && numPartners >= 5) {
      setValue('ceoSelection', 'partner5')
    }
  }, [
    partner1IsCEO,
    partner2IsCEO,
    partner3IsCEO,
    partner4IsCEO,
    partner5IsCEO,
    numPartners,
    setValue,
  ])

  // Limpiar errores de campos de nuevo CEO cuando no están visibles
  useEffect(() => {
    if (ceoSelection !== 'new') {
      clearErrors([
        'newCEOFirstName',
        'newCEOLastName',
        'newCEONationality',
        'newCEODocumentType',
        'newCEODocumentNumber',
        'newCEOEmail',
        'newCEOPhone',
      ])

      // Establecer valores por defecto para evitar campos nulos
      setValue('newCEOFirstName', '')
      setValue('newCEOLastName', '')
      setValue('newCEONationality', 'peruano')
      setValue('newCEODocumentType', 'dni')
      setValue('newCEODocumentNumber', '')
      setValue('newCEOEmail', '')
      setValue('newCEOPhone', '')
    }
  }, [ceoSelection, clearErrors, setValue])

  // Generar opciones dinámicas basadas en el número de socios
  const generateCEOOptions = () => {
    const options = []

    // Añadir opciones para cada socio existente
    for (let i = 1; i <= numPartners; i++) {
      const partnerRole = watch(`partner${i}ExecutiveRole`) || 'none'
      const isCEO = partnerRole === 'ceo'
      const firstName = watch(`partner${i}FirstName`) || `Socio ${i}`
      const lastName = watch(`partner${i}LastName`) || ''
      const displayName = firstName + (lastName ? ` ${lastName}` : '')
      const displayRole =
        partnerRole && partnerRole !== 'none' ? ` (${partnerRole.toUpperCase()})` : ''

      options.push(
        <SelectItem key={`partner${i}`} value={`partner${i}`}>
          {displayName}
          {displayRole}
        </SelectItem>,
      )
    }

    // Añadir opción de nuevo CEO
    options.push(
      <SelectItem key="new" value="new">
        Nuevo CEO (no socio)
      </SelectItem>,
    )

    return options
  }

  // Si no se ha seleccionado el número de socios, mostrar mensaje
  if (!numberOfPartners) {
    return (
      <div className="ceo-selection">
        <p className="text-amber-600">
          Por favor seleccione el número de socios en el paso anterior antes de continuar.
        </p>
      </div>
    )
  }

  return (
    <div className="ceo-selection">
      <Width width={100}>
        <Label htmlFor="ceoSelection">
          Selección de CEO
          <span className="required">
            * <span className="sr-only">(required)</span>
          </span>
        </Label>
        <Controller
          control={control}
          name="ceoSelection"
          rules={{ required: true }}
          render={({ field: { onChange, value } }) => (
            <Select onValueChange={onChange} value={value || ''}>
              <SelectTrigger id="ceoSelection">
                <SelectValue placeholder="Seleccione quién será el CEO" />
              </SelectTrigger>
              <SelectContent>{generateCEOOptions()}</SelectContent>
            </Select>
          )}
        />
        {errors.ceoSelection && <Error />}
      </Width>

      {/* Mostrar información del socio seleccionado como CEO */}
      {ceoSelection.startsWith('partner') && (
        <div className="mt-6 bg-blue-50 p-4 rounded-md">
          <h4 className="text-md font-medium mb-4">Información del Socio CEO seleccionado</h4>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div>
              <p className="text-sm font-medium mb-1">Nombre completo</p>
              <p className="text-sm">
                {watch(`${ceoSelection}FirstName`) || ''} {watch(`${ceoSelection}LastName`) || ''}
              </p>
            </div>
            <div>
              <p className="text-sm font-medium mb-1">Documento</p>
              <p className="text-sm">
                {watch(`${ceoSelection}DocumentType`) || ''}:{' '}
                {watch(`${ceoSelection}DocumentNumber`) || ''}
              </p>
            </div>
            <div>
              <p className="text-sm font-medium mb-1">Contacto</p>
              <p className="text-sm">
                {watch(`${ceoSelection}Email`) || ''} | {watch(`${ceoSelection}Phone`) || ''}
              </p>
            </div>
          </div>
        </div>
      )}

      {/* Campos para nuevo CEO, solo visibles si se selecciona 'new' */}
      {ceoSelection === 'new' && (
        <div className="mt-6 bg-gray-50 p-4 rounded-md">
          <h4 className="text-md font-medium mb-4">Información del Nuevo CEO</h4>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            {/* Nombre */}
            <Width width={50}>
              <Label htmlFor="newCEOFirstName">
                Nombre
                <span className="required">
                  * <span className="sr-only">(required)</span>
                </span>
              </Label>
              <Input
                id="newCEOFirstName"
                type="text"
                {...register('newCEOFirstName', { required: ceoSelection === 'new' })}
              />
              {errors.newCEOFirstName && <Error />}
            </Width>

            {/* Apellido */}
            <Width width={50}>
              <Label htmlFor="newCEOLastName">
                Apellido
                <span className="required">
                  * <span className="sr-only">(required)</span>
                </span>
              </Label>
              <Input
                id="newCEOLastName"
                type="text"
                {...register('newCEOLastName', { required: ceoSelection === 'new' })}
              />
              {errors.newCEOLastName && <Error />}
            </Width>

            {/* Nacionalidad */}
            <Width width={100}>
              <Label htmlFor="newCEONationality">
                Nacionalidad
                <span className="required">
                  * <span className="sr-only">(required)</span>
                </span>
              </Label>
              <Controller
                control={control}
                name="newCEONationality"
                rules={{ required: ceoSelection === 'new' }}
                render={({ field: { onChange, value } }) => (
                  <Select onValueChange={onChange} value={value || ''}>
                    <SelectTrigger id="newCEONationality">
                      <SelectValue placeholder="Seleccione nacionalidad" />
                    </SelectTrigger>
                    <SelectContent>
                      <SelectItem value="peruano">Peruano</SelectItem>
                      <SelectItem value="extranjero">Extranjero</SelectItem>
                    </SelectContent>
                  </Select>
                )}
              />
              {errors.newCEONationality && <Error />}
            </Width>

            {/* Tipo de Documento */}
            <Width width={50}>
              <Label htmlFor="newCEODocumentType">
                Tipo de Documento
                <span className="required">
                  * <span className="sr-only">(required)</span>
                </span>
              </Label>
              <Controller
                control={control}
                name="newCEODocumentType"
                rules={{ required: ceoSelection === 'new' }}
                render={({ field: { onChange, value } }) => (
                  <Select onValueChange={onChange} value={value || ''}>
                    <SelectTrigger id="newCEODocumentType">
                      <SelectValue placeholder="Seleccione tipo" />
                    </SelectTrigger>
                    <SelectContent>
                      <SelectItem value="dni">DNI</SelectItem>
                      <SelectItem value="carnet">Carnet de Extranjería</SelectItem>
                      <SelectItem value="pasaporte">Pasaporte</SelectItem>
                    </SelectContent>
                  </Select>
                )}
              />
              {errors.newCEODocumentType && <Error />}
            </Width>

            {/* Número de Documento */}
            <Width width={50}>
              <Label htmlFor="newCEODocumentNumber">
                Número de Documento
                <span className="required">
                  * <span className="sr-only">(required)</span>
                </span>
              </Label>
              <Input
                id="newCEODocumentNumber"
                type="text"
                {...register('newCEODocumentNumber', { required: ceoSelection === 'new' })}
              />
              {errors.newCEODocumentNumber && <Error />}
            </Width>

            {/* Email */}
            <Width width={50}>
              <Label htmlFor="newCEOEmail">
                Email
                <span className="required">
                  * <span className="sr-only">(required)</span>
                </span>
              </Label>
              <Input
                id="newCEOEmail"
                type="email"
                {...register('newCEOEmail', { required: ceoSelection === 'new' })}
              />
              {errors.newCEOEmail && <Error />}
            </Width>

            {/* Teléfono */}
            <Width width={50}>
              <Label htmlFor="newCEOPhone">
                Teléfono
                <span className="required">
                  * <span className="sr-only">(required)</span>
                </span>
              </Label>
              <Input
                id="newCEOPhone"
                type="tel"
                {...register('newCEOPhone', { required: ceoSelection === 'new' })}
              />
              {errors.newCEOPhone && <Error />}
            </Width>
          </div>
        </div>
      )}
    </div>
  )
}
