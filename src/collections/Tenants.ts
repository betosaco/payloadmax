import type { CollectionConfig } from 'payload'
import { COLLECTIONS } from '../constants/collections'

export const Tenants: CollectionConfig = {
  slug: COLLECTIONS.TENANT,
  admin: {
    useAsTitle: 'name',
    defaultColumns: ['name', 'url', 'createdAt'],
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
      name: 'url',
      type: 'text',
      required: true,
    },
  ],
  timestamps: true,
}
