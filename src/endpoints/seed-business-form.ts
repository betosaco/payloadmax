import { Payload, PayloadRequest } from 'payload'
import { businessForm as businessFormData } from './seed/business-form'
import { onboarding as onboardingPageData } from './seed/onboarding-page'

export const seedBusinessForm = async ({
  payload,
  req,
}: {
  payload: Payload
  req: PayloadRequest
}): Promise<void> => {
  payload.logger.info('Seeding business form and onboarding page...')

  try {
    // Crear el formulario de negocio
    const businessForm = await payload.create({
      collection: 'forms',
      data: businessFormData,
      context: {
        disableRevalidate: true,
      },
    })

    // Obtener una imagen para el hero
    let heroImage
    try {
      // Intentar recuperar una imagen existente para el hero
      const existingMedia = await payload.find({
        collection: 'media',
        limit: 1,
      })

      if (existingMedia.docs && existingMedia.docs.length > 0) {
        heroImage = existingMedia.docs[0]
      } else {
        // Si no hay imágenes, usamos un enfoque alternativo
        payload.logger.info('No existing media found for hero image, using fallback')
      }
    } catch (imageError) {
      payload.logger.error('Error getting hero image:', imageError)
    }

    // Solo crear la página si tenemos la imagen del hero
    if (heroImage) {
      // Crear la página de onBoarding
      await payload.create({
        collection: 'pages',
        data: onboardingPageData({
          businessForm,
          heroImage,
        }),
        context: {
          disableRevalidate: true,
        },
      })

      payload.logger.info('Onboarding page created successfully!')
    } else {
      payload.logger.info('Skipped creating onboarding page due to missing hero image')
    }

    payload.logger.info('Business form seeded successfully!')
  } catch (error) {
    payload.logger.error('Error seeding business form and onboarding page:')
    payload.logger.error(error)
  }
}
