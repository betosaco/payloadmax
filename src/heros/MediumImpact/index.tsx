'use client'
import React from 'react'

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

export const MediumImpactHero: React.FC<Page['hero']> = ({
  links,
  media,
  richText,
  showForm,
  form,
}) => {
  return (
    <div className="">
      <div className="container mb-8">
        <div className={`flex flex-col ${showForm ? 'lg:flex-row' : ''}`}>
          <div className={`${showForm ? 'lg:w-1/2 lg:pr-8' : 'w-full'}`}>
            {richText && <RichText className="mb-6" data={richText} enableGutter={false} />}

            {Array.isArray(links) && links.length > 0 && (
              <ul className={`flex gap-4 ${showForm ? 'mb-8 lg:mb-0' : ''}`}>
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
            <div className="lg:w-1/2 mt-8 lg:mt-0">
              <FormRenderer formData={form} />
            </div>
          )}
        </div>
      </div>
      <div className="container ">
        {media && typeof media === 'object' && (
          <div>
            <Media
              className="-mx-4 md:-mx-8 2xl:-mx-16"
              imgClassName=""
              priority
              resource={media}
            />
            {media?.caption && (
              <div className="mt-3">
                <RichText data={media.caption} enableGutter={false} />
              </div>
            )}
          </div>
        )}
      </div>
    </div>
  )
}
