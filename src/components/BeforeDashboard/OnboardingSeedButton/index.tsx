'use client'

import React, { Fragment, useCallback, useState } from 'react'
import { toast } from '@payloadcms/ui'

import '../SeedButton/index.scss'

const SuccessMessage: React.FC = () => (
  <div>
    ¡Página de Onboarding con formulario de registro de empresa creada exitosamente!{' '}
    <a href="/onboarding" target="_blank">
      Ver página
    </a>
  </div>
)

export const OnboardingSeedButton: React.FC = () => {
  const [loading, setLoading] = useState(false)
  const [seeded, setSeeded] = useState(false)
  const [error, setError] = useState<null | string>(null)

  const handleClick = useCallback(
    async (e: React.MouseEvent<HTMLButtonElement>) => {
      e.preventDefault()

      if (seeded) {
        toast.info('Página de Onboarding ya creada.')
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
                    reject('Ocurrió un error durante la creación de la página de onboarding.')
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
            loading: 'Creando página de onboarding con formulario de registro...',
            success: <SuccessMessage />,
            error: 'Ocurrió un error durante la creación de la página de onboarding.',
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
        Crear Página de Onboarding
      </button>
      {message}
    </Fragment>
  )
}
