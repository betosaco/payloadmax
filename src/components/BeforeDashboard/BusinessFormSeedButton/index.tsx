'use client'

import React, { Fragment, useCallback, useState } from 'react'
import { toast } from '@payloadcms/ui'

import '../SeedButton/index.scss'

const SuccessMessage: React.FC = () => (
  <div>¡Formulario de registro de empresa creado exitosamente!</div>
)

export const BusinessFormSeedButton: React.FC = () => {
  const [loading, setLoading] = useState(false)
  const [seeded, setSeeded] = useState(false)
  const [error, setError] = useState<null | string>(null)

  const handleClick = useCallback(
    async (e: React.MouseEvent<HTMLButtonElement>) => {
      e.preventDefault()

      if (seeded) {
        toast.info('Formulario ya creado.')
        return
      }
      if (loading) {
        toast.info('Creación en progreso.')
        return
      }
      if (error) {
        toast.error(`Ocurrió un error, por favor refresque e intente de nuevo.`)
        return
      }

      setLoading(true)

      try {
        toast.promise(
          new Promise((resolve, reject) => {
            try {
              fetch('/next/seed-business-form', { method: 'POST', credentials: 'include' })
                .then((res) => {
                  if (res.ok) {
                    resolve(true)
                    setSeeded(true)
                  } else {
                    reject('Ocurrió un error durante la creación del formulario.')
                  }
                })
                .catch((error) => {
                  reject(error)
                })
            } catch (error) {
              reject(error)
            }
          }),
          {
            loading: 'Creando formulario de registro de empresa...',
            success: <SuccessMessage />,
            error: 'Ocurrió un error durante la creación del formulario.',
          },
        )
      } catch (err) {
        const error = err instanceof Error ? err.message : String(err)
        setError(error)
      }
    },
    [loading, seeded, error],
  )

  let message = ''
  if (loading) message = ' (creando...)'
  if (seeded) message = ' (¡listo!)'
  if (error) message = ` (error: ${error})`

  return (
    <Fragment>
      <button className="seedButton" onClick={handleClick}>
        Crear Formulario de Registro de Empresa
      </button>
      {message}
    </Fragment>
  )
}
