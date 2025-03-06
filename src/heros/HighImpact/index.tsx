'use client'
import { useHeaderTheme } from '@/providers/HeaderTheme'
import React, { useEffect } from 'react'

import type { Page, Form as PayloadForm } from '@/payload-types'
import type { Form as PluginForm } from '@payloadcms/plugin-form-builder/types'

import { CMSLink } from '@/components/Link'
import { Media } from '@/components/Media'
import RichText from '@/components/RichText'
import { FormBlock } from '@/blocks/Form/Component'

// Custom component to handle form rendering
const FormRenderer: React.FC<{ formData: PayloadForm | number | null | undefined }> = ({
  formData,
}) => {
  // Skip rendering if form is just an ID
  if (typeof formData === 'number' || !formData) {
    return null
  }

  // Use type assertion to satisfy the compiler
  return <FormBlock form={formData as unknown as PluginForm} enableIntro={false} />
}

export const HighImpactHero: React.FC<Page['hero']> = ({
  links,
  media,
  richText,
  showForm,
  form,
}) => {
  const { setHeaderTheme } = useHeaderTheme()

  useEffect(() => {
    setHeaderTheme('dark')
  })

  return (
    <div
      className="relative -mt-[10.4rem] flex items-center justify-center text-white"
      data-theme="dark"
    >
      <div className="container mb-8 z-10 relative flex flex-col lg:flex-row items-center justify-center">
        <div
          className={`${
            showForm
              ? 'max-w-[36.5rem] text-center lg:text-left lg:mr-12 xl:mr-16'
              : 'max-w-[36.5rem] text-center'
          } w-full lg:w-auto`}
        >
          {richText && <RichText className="mb-6" data={richText} enableGutter={false} />}
          {Array.isArray(links) && links.length > 0 && (
            <ul
              className={`flex justify-center ${
                showForm ? 'lg:justify-start' : 'lg:justify-center'
              } gap-4`}
            >
              {links.map(({ link }, i) => {
                return (
                  <li key={i}>
                    <CMSLink {...link} />
                  </li>
                )
              })}
            </ul>
          )}
        </div>
        {showForm && form && (
          <div className="w-full lg:w-[40%] min-w-[320px] mt-8 lg:mt-0">
            <FormRenderer formData={form} />
          </div>
        )}
      </div>
      <div className="min-h-[80vh] select-none">
        {media && typeof media === 'object' && (
          <Media fill imgClassName="-z-10 object-cover" priority resource={media} />
        )}
      </div>
    </div>
  )
}
