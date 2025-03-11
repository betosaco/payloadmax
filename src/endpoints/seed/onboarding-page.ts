import type { Form, Media } from '@/payload-types'
import { RequiredDataFromCollectionSlug } from 'payload'

type OnboardingArgs = {
  businessForm: Form
  heroImage: Media
}

export const onboarding: (args: OnboardingArgs) => RequiredDataFromCollectionSlug<'pages'> = ({
  businessForm,
  heroImage,
}) => {
  return {
    slug: 'onboarding',
    _status: 'published',
    hero: {
      type: 'highImpact',
      links: [
        {
          link: {
            type: 'custom',
            appearance: 'default',
            label: 'Conoce más',
            url: '/',
          },
        },
        {
          link: {
            type: 'custom',
            appearance: 'outline',
            label: 'Contacto',
            url: '/contact',
          },
        },
      ],
      media: heroImage.id,
      richText: {
        root: {
          type: 'root',
          children: [
            {
              type: 'heading',
              children: [
                {
                  type: 'text',
                  detail: 0,
                  format: 0,
                  mode: 'normal',
                  style: '',
                  text: 'Comienza tu Registro de Empresa',
                  version: 1,
                },
              ],
              direction: 'ltr',
              format: '',
              indent: 0,
              tag: 'h1',
              version: 1,
            },
            {
              type: 'paragraph',
              children: [
                {
                  type: 'text',
                  detail: 0,
                  format: 0,
                  mode: 'normal',
                  style: '',
                  text: 'Completa el formulario paso a paso para iniciar el proceso de registro de tu empresa en Perú de manera sencilla y guiada.',
                  version: 1,
                },
              ],
              direction: 'ltr',
              format: '',
              indent: 0,
              version: 1,
            },
          ],
          direction: 'ltr',
          format: '',
          indent: 0,
          version: 1,
        },
      },
    },
    layout: [
      {
        blockType: 'formBlock',
        enableIntro: true,
        form: businessForm,
        backgroundColor: 'white',
        introContent: {
          root: {
            type: 'root',
            children: [
              {
                type: 'heading',
                children: [
                  {
                    type: 'text',
                    detail: 0,
                    format: 0,
                    mode: 'normal',
                    style: '',
                    text: 'Formulario de Registro de Empresa',
                    version: 1,
                  },
                ],
                direction: 'ltr',
                format: '',
                indent: 0,
                tag: 'h3',
                version: 1,
              },
              {
                type: 'paragraph',
                children: [
                  {
                    type: 'text',
                    detail: 0,
                    format: 0,
                    mode: 'normal',
                    style: '',
                    text: 'Complete todos los pasos del formulario para iniciar el proceso de registro de su empresa. Nuestro equipo se pondrá en contacto con usted en breve para continuar con el proceso.',
                    version: 1,
                  },
                ],
                direction: 'ltr',
                format: '',
                indent: 0,
                version: 1,
              },
            ],
            direction: 'ltr',
            format: '',
            indent: 0,
            version: 1,
          },
        },
        multiStep: {
          enabled: true,
          steps: [
            {
              title: 'Selección de Residencia',
              fields: [{ fieldName: 'residenceType' }],
              isPartnersStep: false,
            },
            {
              title: 'Selección de Tipo de Empresa',
              fields: [{ fieldName: 'companyType' }],
              isPartnersStep: false,
            },
            {
              title: 'Propósito Corporativo',
              fields: [
                { fieldName: 'corporatePurpose' },
                { fieldName: 'suggestedName1' },
                { fieldName: 'suggestedName2' },
                { fieldName: 'suggestedName3' },
              ],
              isPartnersStep: false,
            },
            {
              title: 'Información de Socios y Contribuciones',
              fields: [
                { fieldName: 'numberOfPartners' },
                // Los campos de socios se gestionan dinámicamente por el componente PartnersStep
              ],
              isPartnersStep: true,
            },
            {
              title: 'Selección del CEO',
              fields: [
                { fieldName: 'ceoSelection' },
                // Los campos de nuevo CEO se gestionan condicionalmente por el componente CEOSelection
              ],
              isCEOStep: true, // Añadir flag para indicar que es el paso de CEO
            },
            {
              title: 'Información del Solicitante',
              fields: [
                { fieldName: 'firstName' },
                { fieldName: 'lastName' },
                { fieldName: 'documentType' },
                { fieldName: 'documentNumber' },
                { fieldName: 'email' },
                { fieldName: 'countryCode' },
                { fieldName: 'phone' },
              ],
              isPartnersStep: false,
            },
          ],
        },
      },
    ],
    meta: {
      title: 'Registro de Empresa - Nuolat',
      description: 'Proceso de registro de empresa en Perú con Nuolat',
    },
    title: 'Registro de Empresa',
  }
}
