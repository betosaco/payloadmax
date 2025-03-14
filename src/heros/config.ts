import type { Field } from 'payload'

import {
  FixedToolbarFeature,
  HeadingFeature,
  InlineToolbarFeature,
  lexicalEditor,
} from '@payloadcms/richtext-lexical'

import { linkGroup } from '@/fields/linkGroup'

export const hero: Field = {
  name: 'hero',
  type: 'group',
  fields: [
    {
      name: 'type',
      type: 'select',
      defaultValue: 'lowImpact',
      label: 'Type',
      options: [
        {
          label: 'None',
          value: 'none',
        },
        {
          label: 'High Impact',
          value: 'highImpact',
        },
        {
          label: 'Medium Impact',
          value: 'mediumImpact',
        },
        {
          label: 'Low Impact',
          value: 'lowImpact',
        },
      ],
      required: true,
    },
    {
      name: 'richText',
      type: 'richText',
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
      label: false,
    },
    linkGroup({
      overrides: {
        maxRows: 2,
      },
    }),
    {
      name: 'media',
      type: 'upload',
      admin: {
        condition: (_, { type } = {}) => ['highImpact', 'mediumImpact'].includes(type),
      },
      relationTo: 'media',
      required: true,
    },
    {
      name: 'showForm',
      type: 'checkbox',
      label: 'Mostrar formulario al lado derecho',
      admin: {
        condition: (_, { type } = {}) => ['highImpact', 'mediumImpact'].includes(type),
        description:
          'Selecciona esta opción para mostrar un formulario en el lado derecho del hero',
      },
    },
    {
      name: 'form',
      type: 'relationship',
      relationTo: 'forms',
      admin: {
        condition: (_, { showForm } = {}) => Boolean(showForm),
        description: 'Selecciona el formulario que se mostrará en el lado derecho del hero',
      },
      required: false,
    },
    {
      name: 'formBackgroundColor',
      type: 'select',
      label: 'Color de Fondo del Formulario',
      defaultValue: 'transparent',
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
        condition: (_, { showForm } = {}) => Boolean(showForm),
        description: 'Selecciona el color de fondo para el formulario',
      },
    },
  ],
  label: false,
}
