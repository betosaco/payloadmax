import type { CollectionConfig } from 'payload'
import { COLLECTIONS } from '../constants/collections'

export const Tags: CollectionConfig = {
  slug: COLLECTIONS.TAG,
  admin: {
    useAsTitle: 'name',
    defaultColumns: ['name', 'category', 'createdAt'],
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
      unique: true,
      index: true,
      admin: {
        description: 'Name of the tag',
      },
    },
    {
      name: 'category',
      type: 'text',
      admin: {
        description: 'Category this tag belongs to (optional)',
      },
    },
    {
      name: 'description',
      type: 'textarea',
      admin: {
        description: 'Description of what this tag represents',
      },
    },
    {
      name: 'consumers',
      type: 'relationship',
      relationTo: COLLECTIONS.CONSUMER as any,
      hasMany: true,
      admin: {
        description: 'Consumers associated with this tag',
        readOnly: true,
      },
    },
  ],
  timestamps: true,
}
