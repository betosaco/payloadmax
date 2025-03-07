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
      name: 'multiStep',
      type: 'group',
      label: 'Multi-Step Form Configuration',
      fields: [
        {
          name: 'enabled',
          type: 'checkbox',
          label: 'Enable Multi-Step Form',
          defaultValue: false,
        },
        {
          name: 'steps',
          type: 'array',
          label: 'Form Steps',
          admin: {
            condition: (_, { multiStep }) => Boolean(multiStep?.enabled),
            description:
              'Define the steps for your multi-step form. Each step should contain a title and list of fields to display.',
          },
          validate: (value) => {
            // Only validate if there is a value to validate
            if (!value) return true

            if (!Array.isArray(value) || value.length === 0) {
              return 'At least one step is required for a multi-step form'
            }

            // Further validation could be added here to verify field names exist in the form
            return true
          },
          fields: [
            {
              name: 'title',
              type: 'text',
              label: 'Step Title',
              required: true,
            },
            {
              name: 'fields',
              type: 'array',
              label: 'Fields to Display',
              minRows: 1,
              required: true,
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
                  admin: {
                    description: 'Enter the name of the field as defined in your form',
                  },
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
