import type { CollectionConfig } from 'payload'
import { COLLECTIONS } from '../constants/collections'
import { BundleUsageEventType } from '../constants/enums'

export const BundleUsageEvents: CollectionConfig = {
  slug: COLLECTIONS.BUNDLE_USAGE_EVENT,
  admin: {
    useAsTitle: 'id',
    defaultColumns: ['bundle', 'reservation', 'type', 'quantity', 'createdAt'],
  },
  access: {
    read: () => true,
    create: () => true,
    update: () => true,
    delete: () => true,
  },
  fields: [
    {
      name: 'bundle',
      type: 'relationship',
      relationTo: COLLECTIONS.BUNDLE as any,
      required: true,
      index: true,
      admin: {
        description: 'Bundle associated with this usage event',
      },
    },
    {
      name: 'reservation',
      type: 'relationship',
      relationTo: COLLECTIONS.RESERVATION as any,
      required: true,
      index: true,
      admin: {
        description: 'Reservation associated with this usage event',
      },
    },
    {
      name: 'type',
      type: 'select',
      required: true,
      options: Object.values(BundleUsageEventType),
      defaultValue: BundleUsageEventType.USE,
      index: true,
      admin: {
        description: 'Type of usage event',
      },
    },
    {
      name: 'quantity',
      type: 'number',
      required: true,
      defaultValue: 1,
      admin: {
        description: 'Quantity of units used/refunded/expired/cancelled',
      },
    },
    {
      name: 'note',
      type: 'textarea',
      admin: {
        description: 'Additional notes about this usage event',
      },
    },
  ],
  timestamps: true,
}
