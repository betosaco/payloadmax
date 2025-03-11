import type { CollectionConfig } from 'payload'
import { COLLECTIONS } from '../constants/collections'

export const Contexts: CollectionConfig = {
  slug: COLLECTIONS.CONTEXT,
  admin: {
    useAsTitle: 'name',
    defaultColumns: ['name', 'agency', 'parentContext', 'defaultBufferTime', 'defaultMaxCapacity'],
  },
  access: {
    read: () => true,
    create: () => true,
    update: () => true,
    delete: () => true,
  },
  fields: [
    {
      name: 'name',
      type: 'text',
      required: true,
      index: true,
    },
    {
      name: 'agency',
      type: 'relationship',
      relationTo: COLLECTIONS.AGENCY as any,
      required: true,
      index: true,
    },
    {
      name: 'parentContext',
      type: 'relationship',
      relationTo: COLLECTIONS.CONTEXT as any,
      admin: {
        description: 'Parent context if this is a sub-context',
      },
    },
    {
      name: 'defaultBufferTime',
      type: 'number',
      required: true,
      min: 0,
      defaultValue: 15,
      admin: {
        description: 'Default buffer time in minutes between sessions',
      },
    },
    {
      name: 'defaultMaxCapacity',
      type: 'number',
      required: true,
      min: 1,
      defaultValue: 10,
      admin: {
        description: 'Default maximum capacity for sessions in this context',
      },
    },
    {
      name: 'description',
      type: 'textarea',
      admin: {
        description: 'Detailed description of this context',
      },
    },
  ],
  timestamps: true,
}
