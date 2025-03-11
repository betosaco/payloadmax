import type { CollectionConfig } from 'payload'
import { COLLECTIONS } from '../constants/collections'

export const Addresses: CollectionConfig = {
  slug: COLLECTIONS.ADDRESS,
  admin: {
    useAsTitle: 'line1',
    defaultColumns: ['line1', 'city', 'state', 'postalCode', 'country'],
  },
  access: {
    read: () => true,
    create: () => true,
    update: () => true,
    delete: () => true,
  },
  fields: [
    {
      name: 'line1',
      type: 'text',
      required: true,
      admin: {
        description: 'Address line 1',
      },
    },
    {
      name: 'line2',
      type: 'text',
      admin: {
        description: 'Address line 2 (optional)',
      },
    },
    {
      name: 'city',
      type: 'text',
      required: true,
      admin: {
        description: 'City',
      },
    },
    {
      name: 'state',
      type: 'text',
      required: true,
      admin: {
        description: 'State/Province/Region',
      },
    },
    {
      name: 'postalCode',
      type: 'text',
      required: true,
      admin: {
        description: 'Postal/ZIP code',
      },
    },
    {
      name: 'country',
      type: 'text',
      required: true,
      admin: {
        description: 'Country',
      },
    },
    {
      name: 'latitude',
      type: 'number',
      admin: {
        description: 'Latitude coordinate (optional)',
      },
    },
    {
      name: 'longitude',
      type: 'number',
      admin: {
        description: 'Longitude coordinate (optional)',
      },
    },
    {
      name: 'isVerified',
      type: 'checkbox',
      defaultValue: false,
      admin: {
        description: 'Whether this address has been verified',
      },
    },
    {
      name: 'consumers',
      type: 'relationship',
      relationTo: COLLECTIONS.CONSUMER as any,
      hasMany: true,
      admin: {
        description: 'Consumers associated with this address',
        readOnly: true,
      },
    },
  ],
  timestamps: true,
}
