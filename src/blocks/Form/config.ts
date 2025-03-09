import type { Block } from 'payload'

import {
  FixedToolbarFeature,
  HeadingFeature,
  InlineToolbarFeature,
  lexicalEditor,
} from '@payloadcms/richtext-lexical'

export const FormBlock: Block = {
  slug: 'formBlock',
  interfaceName: 'FormBlock',
  fields: [
    {
      name: 'form',
      type: 'relationship',
      relationTo: 'forms',
      required: true,
    },
    {
      name: 'enableIntro',
      type: 'checkbox',
      label: 'Enable Intro Content',
    },
    {
      name: 'introContent',
      type: 'richText',
      admin: {
        condition: (_, { enableIntro }) => Boolean(enableIntro),
      },
      editor: lexicalEditor({
        features: ({ rootFeatures }) => {
          return [
            ...rootFeatures,
            HeadingFeature({ enabledHeadingSizes: ['h1', 'h2', 'h3', 'h4'] }),
            FixedToolbarFeature(),
            InlineToolbarFeature(),
          ]
        },
      }),
      label: 'Intro Content',
    },
    {
      name: 'backgroundColor',
      type: 'select',
      label: 'Color de Fondo',
      defaultValue: 'white',
      options: [
        {
          label: 'Transparente',
          value: 'transparent',
        },
        {
          label: 'Blanco',
          value: 'white',
        },
        {
          label: 'Gris Claro',
          value: 'gray-50',
        },
        {
          label: 'Gris',
          value: 'gray-100',
        },
        {
          label: 'Crema',
          value: 'cream',
        },
        {
          label: 'Beige',
          value: 'beige',
        },
        {
          label: 'Azul Claro',
          value: 'blue-50',
        },
        {
          label: 'Azul',
          value: 'blue-100',
        },
        {
          label: 'Verde Claro',
          value: 'green-50',
        },
        {
          label: 'Verde',
          value: 'green-100',
        },
        {
          label: 'Rosa',
          value: 'pink-50',
        },
        {
          label: 'Lavanda',
          value: 'purple-50',
        },
        {
          label: 'Amarillo Claro',
          value: 'yellow-50',
        },
      ],
      admin: {
        description: 'Selecciona el color de fondo para el formulario',
      },
    },
    {
      name: 'multiStep',
      type: 'group',
      label: 'Multi-Step Form Configuration',
      fields: [
        {
          name: 'enabled',
          type: 'checkbox',
          label: 'Enable Multi-Step Form',
        },
        {
          name: 'steps',
          type: 'array',
          label: 'Steps',
          admin: {
            condition: (data: any, siblingData: { enabled?: boolean }) =>
              Boolean(siblingData?.enabled),
          },
          labels: {
            singular: 'Step',
            plural: 'Steps',
          },
          fields: [
            {
              name: 'title',
              type: 'text',
              label: 'Step Title',
              required: true,
            },
            {
              name: 'isPartnersStep',
              type: 'checkbox',
              label: 'Is Partners Step (Enables dynamic partner fields)',
            },
            {
              name: 'fields',
              type: 'array',
              label: 'Fields to Show in this Step',
              admin: {
                condition: (data: any, siblingData: { isPartnersStep?: boolean }) =>
                  siblingData?.isPartnersStep !== true,
              },
              minRows: 1,
              labels: {
                singular: 'Field',
                plural: 'Fields',
              },
              fields: [
                {
                  name: 'fieldName',
                  type: 'text',
                  label: 'Field Name',
                  required: true,
                },
              ],
            },
          ],
        },
      ],
    },
  ],
  graphQL: {
    singularName: 'FormBlock',
  },
  labels: {
    plural: 'Form Blocks',
    singular: 'Form Block',
  },
}
