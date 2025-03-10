'use client'
import React, { useState, useEffect } from 'react'
import { getClientSideURL } from '../../utilities/getURL'
import { Banner } from '@payloadcms/ui/elements/Banner'
import './index.scss' // Importar estilos SCSS

// Tipos para las formas y submissions
type Form = {
  id: string
  title?: string
  name?: string
}

type SubmissionDataItem = {
  field: string
  value: string | object | null
}

type Submission = {
  id: string
  createdAt: string
  updatedAt?: string
  submissionData: SubmissionDataItem[]
  suggestedName1?: string
}

// Categorías para agrupar campos
enum FieldCategory {
  EMPRESA = 'Información de la Empresa',
  SOCIOS = 'Información de los Socios',
  CEO = 'Datos del CEO',
  SOLICITANTE = 'Información del Solicitante',
  OTROS = 'Otros Datos',
}

// Colores corporativos
const colors = {
  primary: 'var(--theme-success-500, #0284c7)',
  secondary: 'var(--theme-elevation-800, #1e293b)',
  accent: 'var(--theme-success-100, #e0f2fe)',
  border: 'var(--theme-elevation-200, #e2e8f0)',
  background: 'var(--theme-elevation-50, #f8fafc)',
  text: {
    primary: 'var(--theme-elevation-800, #1e293b)',
    secondary: 'var(--theme-elevation-600, #475569)',
    light: 'var(--theme-elevation-500, #64748b)',
  },
}

// Función para categorizar campos
const categorizeField = (fieldName: string): FieldCategory => {
  const lowerField = fieldName.toLowerCase()

  if (
    lowerField.includes('compañía') ||
    lowerField.includes('empresa') ||
    lowerField.includes('company') ||
    lowerField.includes('business') ||
    lowerField.includes('tax') ||
    lowerField.includes('fiscal') ||
    lowerField.includes('rfc') ||
    lowerField.includes('domicilio') ||
    lowerField.includes('address') ||
    lowerField.includes('razón social')
  ) {
    return FieldCategory.EMPRESA
  }

  if (
    lowerField.includes('socio') ||
    lowerField.includes('partner') ||
    lowerField.includes('accionista') ||
    lowerField.includes('shareholder')
  ) {
    return FieldCategory.SOCIOS
  }

  if (
    lowerField.includes('ceo') ||
    lowerField.includes('director') ||
    lowerField.includes('ejecutivo') ||
    lowerField.includes('executive')
  ) {
    return FieldCategory.CEO
  }

  if (
    lowerField.includes('solicitante') ||
    lowerField.includes('applicant') ||
    lowerField.includes('contacto') ||
    lowerField.includes('contact') ||
    lowerField.includes('nombre') ||
    lowerField.includes('telefono') ||
    lowerField.includes('correo') ||
    lowerField.includes('email')
  ) {
    return FieldCategory.SOLICITANTE
  }

  return FieldCategory.OTROS
}

// Iconos para categorías
const getCategoryIcon = (category: FieldCategory): string => {
  switch (category) {
    case FieldCategory.EMPRESA:
      return '🏢'
    case FieldCategory.SOCIOS:
      return '👥'
    case FieldCategory.CEO:
      return '👔'
    case FieldCategory.SOLICITANTE:
      return '📋'
    case FieldCategory.OTROS:
      return '📎'
  }
}

const baseClass = 'form-submissions-viewer' // Clase base para el componente

const FormSubmissionsViewer: React.FC = () => {
  const [selectedForm, setSelectedForm] = useState<string>('')
  const [expandedSubmissions, setExpandedSubmissions] = useState<Record<string, boolean>>({})
  const [expandedCategories, setExpandedCategories] = useState<Record<string, boolean>>({})
  const [formsData, setFormsData] = useState<{ docs: Form[]; totalDocs: number } | null>(null)
  const [submissionsData, setSubmissionsData] = useState<{
    docs: Submission[]
    totalDocs: number
  } | null>(null)
  const [isLoadingForms, setIsLoadingForms] = useState<boolean>(false)
  const [isLoadingSubmissions, setIsLoadingSubmissions] = useState<boolean>(false)

  const serverURL = getClientSideURL()

  // Consulta las formas disponibles
  useEffect(() => {
    const fetchForms = async () => {
      setIsLoadingForms(true)
      try {
        const res = await fetch(`${serverURL}/api/forms?limit=100`, {
          headers: {
            'Content-Type': 'application/json',
          },
          credentials: 'include',
        })
        const data = await res.json()
        setFormsData(data)
      } catch (error) {
        console.error('Error fetching forms:', error)
      } finally {
        setIsLoadingForms(false)
      }
    }

    fetchForms()
  }, [serverURL])

  // Consulta las submissions basadas en el formulario seleccionado
  useEffect(() => {
    const fetchSubmissions = async () => {
      if (!selectedForm) return

      setIsLoadingSubmissions(true)
      try {
        const res = await fetch(
          `${serverURL}/api/form-submissions?where[form][equals]=${selectedForm}&depth=0&limit=100&sort=-createdAt`,
          {
            headers: {
              'Content-Type': 'application/json',
            },
            credentials: 'include',
          },
        )
        const data = await res.json()
        setSubmissionsData(data)

        // Inicializar todas las categorías como expandidas
        if (data.docs && data.docs.length > 0) {
          const initialCategories: Record<string, boolean> = {}
          Object.values(FieldCategory).forEach((category) => {
            initialCategories[category] = true
          })
          setExpandedCategories(initialCategories)
        }
      } catch (error) {
        console.error('Error fetching submissions:', error)
      } finally {
        setIsLoadingSubmissions(false)
      }
    }

    if (selectedForm) {
      fetchSubmissions()
    }
  }, [serverURL, selectedForm])

  const toggleSubmission = (id: string) => {
    setExpandedSubmissions((prev) => ({
      ...prev,
      [id]: !prev[id],
    }))
  }

  const toggleCategory = (submissionId: string, category: string) => {
    const key = `${submissionId}-${category}`
    setExpandedCategories((prev) => ({
      ...prev,
      [key]: !prev[key],
    }))
  }

  const isCategoryExpanded = (submissionId: string, category: string): boolean => {
    const key = `${submissionId}-${category}`
    return expandedCategories[key] !== false // Por defecto expandido
  }

  const formatDate = (dateString: string) => {
    const date = new Date(dateString)
    return new Intl.DateTimeFormat('es-ES', {
      year: 'numeric',
      month: 'long',
      day: 'numeric',
      hour: 'numeric',
      minute: 'numeric',
    }).format(date)
  }

  // Acortar valores largos
  const shortenValue = (value: string | object | null): string => {
    if (!value) return ''

    if (typeof value === 'object') {
      const json = JSON.stringify(value)
      return json.length > 80 ? json.substring(0, 77) + '...' : json
    }

    const str = String(value)
    return str.length > 80 ? str.substring(0, 77) + '...' : str
  }

  // Función para agrupar items por categoría
  const groupSubmissionItems = (items: SubmissionDataItem[]) => {
    const grouped: Record<FieldCategory, SubmissionDataItem[]> = {
      [FieldCategory.EMPRESA]: [],
      [FieldCategory.SOCIOS]: [],
      [FieldCategory.CEO]: [],
      [FieldCategory.SOLICITANTE]: [],
      [FieldCategory.OTROS]: [],
    }

    items.forEach((item) => {
      const category = categorizeField(item.field)
      grouped[category].push(item)
    })

    return grouped
  }

  return (
    <div
      style={{
        margin: '2rem 0',
        fontFamily:
          'var(--font-body, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", sans-serif)',
        color: colors.text.primary,
        maxWidth: '1400px',
      }}
    >
      <div
        style={{
          display: 'flex',
          alignItems: 'center',
          gap: '0.5rem',
          borderBottom: `2px solid ${colors.primary}`,
          paddingBottom: '0.75rem',
          marginBottom: '1.5rem',
        }}
      >
        <div
          style={{
            width: '2rem',
            height: '2rem',
            borderRadius: '4px',
            background: colors.primary,
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            fontSize: '1.25rem',
            color: 'white',
          }}
        >
          📋
        </div>
        <h2
          style={{
            fontSize: '1.5rem',
            fontWeight: 600,
            color: colors.secondary,
            margin: 0,
          }}
        >
          Portal de Solicitudes
        </h2>
      </div>

      <div
        style={{
          background: colors.background,
          padding: '1.5rem',
          borderRadius: '8px',
          marginBottom: '2rem',
          boxShadow: '0 1px 3px rgba(0,0,0,0.05)',
          border: `1px solid ${colors.border}`,
        }}
      >
        <p
          style={{
            marginBottom: '1.25rem',
            fontSize: '1rem',
            color: colors.text.secondary,
            fontWeight: 500,
          }}
        >
          Seleccione un formulario para visualizar las solicitudes:
        </p>

        {isLoadingForms ? (
          <Banner type="info">Cargando formularios...</Banner>
        ) : (
          <div className="field-type">
            <label
              className="field-label"
              style={{
                display: 'block',
                marginBottom: '0.5rem',
                fontWeight: 500,
                color: colors.text.secondary,
              }}
            >
              Formulario
            </label>
            <select
              className="select-input"
              value={selectedForm}
              onChange={(e: React.ChangeEvent<HTMLSelectElement>) =>
                setSelectedForm(e.target.value)
              }
              style={{
                width: '100%',
                padding: '0.875rem 1rem',
                borderRadius: '6px',
                border: `1px solid ${colors.border}`,
                background: 'white',
                fontSize: '1rem',
                appearance: 'none',
                backgroundImage:
                  "url(\"data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='%230284c7' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e\")",
                backgroundRepeat: 'no-repeat',
                backgroundPosition: 'right 0.75rem center',
                backgroundSize: '16px',
                boxShadow: '0 1px 2px rgba(0,0,0,0.05)',
                fontWeight: 500,
                color: colors.text.primary,
              }}
            >
              <option value="">Seleccione un formulario</option>
              {formsData?.docs?.map((form) => (
                <option key={form.id} value={form.id}>
                  {form.title || form.name || `Formulario #${form.id}`}
                </option>
              ))}
            </select>
          </div>
        )}
      </div>

      {selectedForm && (
        <div style={{ paddingTop: '1rem' }}>
          <div
            style={{
              display: 'flex',
              justifyContent: 'space-between',
              alignItems: 'center',
              marginBottom: '1.5rem',
              flexWrap: 'wrap',
              gap: '1rem',
            }}
          >
            <div
              style={{
                display: 'flex',
                alignItems: 'center',
                gap: '0.5rem',
              }}
            >
              <div
                style={{
                  width: '1.5rem',
                  height: '1.5rem',
                  borderRadius: '50%',
                  background: colors.accent,
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'center',
                  fontSize: '0.75rem',
                  color: colors.primary,
                  fontWeight: 'bold',
                }}
              >
                {submissionsData?.totalDocs || 0}
              </div>
              <h3
                style={{
                  fontSize: '1.25rem',
                  fontWeight: 600,
                  color: colors.secondary,
                  margin: 0,
                }}
              >
                Solicitudes
              </h3>
            </div>

            <div
              style={{
                background: 'white',
                padding: '0.5rem 0.75rem',
                borderRadius: '20px',
                fontSize: '0.875rem',
                fontWeight: 500,
                border: `1px solid ${colors.border}`,
                color: colors.text.secondary,
                display: 'flex',
                alignItems: 'center',
                gap: '0.5rem',
              }}
            >
              <span style={{ fontSize: '0.875rem' }}>🗓️</span>
              {formatDate(new Date().toISOString())}
            </div>
          </div>

          {isLoadingSubmissions ? (
            <Banner type="info">Cargando solicitudes...</Banner>
          ) : submissionsData?.docs?.length === 0 ? (
            <div
              style={{
                padding: '3rem',
                textAlign: 'center',
                background: colors.background,
                borderRadius: '8px',
                color: colors.text.light,
                fontStyle: 'italic',
                border: `1px solid ${colors.border}`,
              }}
            >
              No hay solicitudes registradas para este formulario.
            </div>
          ) : (
            <div
              style={{
                display: 'grid',
                gap: '1.5rem',
                gridTemplateColumns: 'repeat(auto-fill, minmax(min(100%, 600px), 1fr))',
              }}
            >
              {submissionsData?.docs?.map((submission) => {
                const grouped = groupSubmissionItems(submission.submissionData || [])

                return (
                  <div
                    key={submission.id}
                    style={{
                      border: `1px solid ${colors.border}`,
                      borderRadius: '10px',
                      overflow: 'hidden',
                      background: 'white',
                      boxShadow: '0 2px 6px rgba(0,0,0,0.05)',
                      transition: 'box-shadow 0.2s ease-in-out, transform 0.2s ease-in-out',
                      height: 'fit-content',
                    }}
                  >
                    <div
                      style={{
                        padding: '1.25rem',
                        borderBottom: expandedSubmissions[submission.id]
                          ? `1px solid ${colors.border}`
                          : 'none',
                        background: colors.background,
                        display: 'flex',
                        justifyContent: 'space-between',
                        alignItems: 'center',
                      }}
                    >
                      <h4
                        style={{
                          margin: 0,
                          fontSize: '1.1rem',
                          fontWeight: 600,
                          color: colors.primary,
                          display: 'flex',
                          alignItems: 'center',
                          gap: '0.5rem',
                        }}
                      >
                        <div
                          style={{
                            width: '1.75rem',
                            height: '1.75rem',
                            background: colors.accent,
                            borderRadius: '50%',
                            display: 'flex',
                            alignItems: 'center',
                            justifyContent: 'center',
                            color: colors.primary,
                            fontSize: '0.85rem',
                          }}
                        >
                          📑
                        </div>
                        {submission.suggestedName1 || `Solicitud #${submission.id}`}
                      </h4>

                      <button
                        onClick={() => toggleSubmission(submission.id)}
                        style={{
                          background: expandedSubmissions[submission.id] ? colors.accent : 'white',
                          border: `1px solid ${expandedSubmissions[submission.id] ? colors.primary : colors.border}`,
                          borderRadius: '6px',
                          padding: '0.5rem 0.875rem',
                          cursor: 'pointer',
                          fontWeight: 500,
                          fontSize: '0.875rem',
                          display: 'flex',
                          alignItems: 'center',
                          gap: '0.375rem',
                          transition: 'all 0.2s ease-in-out',
                          color: expandedSubmissions[submission.id]
                            ? colors.primary
                            : colors.text.secondary,
                        }}
                      >
                        {expandedSubmissions[submission.id] ? 'Ocultar detalles' : 'Ver detalles'}
                        <span
                          style={{
                            transition: 'transform 0.2s ease-in-out',
                            transform: expandedSubmissions[submission.id]
                              ? 'rotate(180deg)'
                              : 'rotate(0)',
                            display: 'inline-block',
                            fontSize: '0.75rem',
                          }}
                        >
                          ▼
                        </span>
                      </button>
                    </div>

                    {expandedSubmissions[submission.id] && (
                      <div style={{ padding: '1.25rem' }}>
                        <div
                          style={{
                            display: 'flex',
                            justifyContent: 'space-between',
                            fontSize: '0.875rem',
                            color: colors.text.light,
                            marginBottom: '1.75rem',
                            flexWrap: 'wrap',
                            gap: '0.75rem',
                            padding: '0.75rem',
                            background: colors.background,
                            borderRadius: '6px',
                          }}
                        >
                          <div
                            style={{
                              display: 'flex',
                              alignItems: 'center',
                              gap: '0.375rem',
                            }}
                          >
                            <span style={{ fontSize: '0.85rem' }}>📅</span>
                            <strong style={{ fontWeight: 600, color: colors.text.secondary }}>
                              Creado:
                            </strong>
                            {formatDate(submission.createdAt)}
                          </div>
                          {submission.updatedAt && (
                            <div
                              style={{
                                display: 'flex',
                                alignItems: 'center',
                                gap: '0.375rem',
                              }}
                            >
                              <span style={{ fontSize: '0.85rem' }}>🔄</span>
                              <strong style={{ fontWeight: 600, color: colors.text.secondary }}>
                                Actualizado:
                              </strong>
                              {formatDate(submission.updatedAt)}
                            </div>
                          )}
                        </div>

                        {/* Sección para cada categoría de datos */}
                        {Object.entries(grouped).map(([category, items]) => {
                          if (items.length === 0) return null
                          const categoryKey = `${submission.id}-${category}`
                          const isExpanded = isCategoryExpanded(submission.id, category)

                          return (
                            <div
                              key={categoryKey}
                              style={{
                                marginBottom: '1.5rem',
                                borderRadius: '8px',
                                border: `1px solid ${colors.border}`,
                                overflow: 'hidden',
                              }}
                            >
                              <button
                                onClick={() => toggleCategory(submission.id, category)}
                                style={{
                                  width: '100%',
                                  padding: '0.75rem 1rem',
                                  display: 'flex',
                                  justifyContent: 'space-between',
                                  alignItems: 'center',
                                  background: colors.background,
                                  border: 'none',
                                  textAlign: 'left',
                                  cursor: 'pointer',
                                  transition: 'background 0.2s ease-in-out',
                                }}
                              >
                                <div
                                  style={{
                                    display: 'flex',
                                    alignItems: 'center',
                                    gap: '0.5rem',
                                    fontSize: '1rem',
                                    fontWeight: 600,
                                    color: colors.text.primary,
                                  }}
                                >
                                  <span style={{ fontSize: '1.1rem' }}>
                                    {getCategoryIcon(category as FieldCategory)}
                                  </span>
                                  {category}
                                  <span
                                    style={{
                                      fontSize: '0.75rem',
                                      fontWeight: 'normal',
                                      background: colors.accent,
                                      color: colors.primary,
                                      borderRadius: '12px',
                                      padding: '0.125rem 0.5rem',
                                    }}
                                  >
                                    {items.length}
                                  </span>
                                </div>
                                <span
                                  style={{
                                    transition: 'transform 0.2s ease-in-out',
                                    transform: isExpanded ? 'rotate(180deg)' : 'rotate(0)',
                                    display: 'inline-block',
                                    fontSize: '0.75rem',
                                    color: colors.text.light,
                                  }}
                                >
                                  ▼
                                </span>
                              </button>

                              {isExpanded && (
                                <div
                                  style={{
                                    padding: '0.75rem 1rem',
                                    display: 'flex',
                                    flexDirection: 'column',
                                    gap: '0.75rem',
                                  }}
                                >
                                  {items.map((item, i) => (
                                    <div
                                      key={i}
                                      style={{
                                        padding: '0.875rem',
                                        background: i % 2 === 0 ? 'white' : colors.background,
                                        borderRadius: '6px',
                                        border: `1px solid ${colors.border}`,
                                        transition: 'box-shadow 0.2s ease-in-out',
                                      }}
                                    >
                                      <div
                                        style={{
                                          fontSize: '0.75rem',
                                          fontWeight: 600,
                                          color: colors.text.secondary,
                                          marginBottom: '0.375rem',
                                          textTransform: 'uppercase',
                                          letterSpacing: '0.03em',
                                          display: 'flex',
                                          alignItems: 'center',
                                          gap: '0.375rem',
                                        }}
                                      >
                                        <span
                                          style={{
                                            width: '0.5rem',
                                            height: '0.5rem',
                                            borderRadius: '50%',
                                            background: colors.primary,
                                            display: 'inline-block',
                                          }}
                                        ></span>
                                        {item.field}
                                      </div>

                                      {typeof item.value === 'object' ||
                                      (typeof item.value === 'string' && item.value.length > 80) ? (
                                        <details
                                          style={{
                                            marginTop: '0.25rem',
                                          }}
                                        >
                                          <summary
                                            style={{
                                              fontSize: '0.9375rem',
                                              cursor: 'pointer',
                                              color: colors.text.primary,
                                              fontWeight: 500,
                                            }}
                                          >
                                            {shortenValue(item.value)}
                                          </summary>
                                          <div
                                            style={{
                                              marginTop: '0.5rem',
                                              padding: '0.75rem',
                                              background: colors.background,
                                              borderRadius: '4px',
                                              fontSize: '0.875rem',
                                              fontFamily:
                                                typeof item.value === 'object'
                                                  ? 'monospace'
                                                  : 'inherit',
                                              whiteSpace:
                                                typeof item.value === 'object'
                                                  ? 'pre-wrap'
                                                  : 'normal',
                                              overflowX: 'auto',
                                            }}
                                          >
                                            {item.value && typeof item.value === 'object'
                                              ? JSON.stringify(item.value, null, 2)
                                              : String(item.value || '')}
                                          </div>
                                        </details>
                                      ) : (
                                        <div
                                          style={{
                                            fontSize: '0.9375rem',
                                            wordBreak: 'break-word',
                                            color: colors.text.primary,
                                          }}
                                        >
                                          {item.value || (
                                            <span
                                              style={{
                                                color: colors.text.light,
                                                fontStyle: 'italic',
                                              }}
                                            >
                                              Sin datos
                                            </span>
                                          )}
                                        </div>
                                      )}
                                    </div>
                                  ))}
                                </div>
                              )}
                            </div>
                          )
                        })}
                      </div>
                    )}
                  </div>
                )
              })}
            </div>
          )}
        </div>
      )}
    </div>
  )
}

export default FormSubmissionsViewer
