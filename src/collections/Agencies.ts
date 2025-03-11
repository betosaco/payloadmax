import type { CollectionConfig } from 'payload'
import { COLLECTIONS } from '../constants/collections'
import { AgencyStatus } from '../constants/enums'

export const Agencies: CollectionConfig = {
  slug: COLLECTIONS.AGENCY,
  admin: {
    useAsTitle: 'name',
    defaultColumns: ['name', 'status', 'tenant', 'createdAt'],
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
      name: 'status',
      type: 'select',
      required: true,
      options: Object.values(AgencyStatus),
      defaultValue: AgencyStatus.ACTIVE,
      index: true,
    },
    {
      name: 'address',
      type: 'text',
      required: true,
    },
    {
      name: 'timezone',
      type: 'text',
      required: true,
    },
    {
      name: 'tenant',
      type: 'relationship',
      relationTo: COLLECTIONS.TENANT as any,
      required: true,
      index: true,
    },
  ],
  timestamps: true,
}
