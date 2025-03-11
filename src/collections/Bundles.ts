import type { CollectionConfig } from 'payload'
import { COLLECTIONS } from '../constants/collections'
import { BundleStatus } from '../constants/enums'

export const Bundles: CollectionConfig = {
  slug: COLLECTIONS.BUNDLE,
  admin: {
    useAsTitle: 'id',
    defaultColumns: ['consumer', 'status', 'validFrom', 'validTo', 'createdAt'],
  },
  access: {
    read: () => true,
    create: () => true,
    update: () => true,
    delete: () => true,
  },
  fields: [
    {
      name: 'status',
      type: 'select',
      required: true,
      options: Object.values(BundleStatus),
      defaultValue: BundleStatus.ACTIVE,
      index: true,
      admin: {
        description: 'Current status of this bundle',
      },
    },
    {
      name: 'validFrom',
      type: 'date',
      required: true,
      index: true,
      admin: {
        date: {
          pickerAppearance: 'dayAndTime',
          displayFormat: 'MMM d, yyyy h:mm a',
        },
        description: 'Start date of validity period',
      },
    },
    {
      name: 'validTo',
      type: 'date',
      required: true,
      index: true,
      admin: {
        date: {
          pickerAppearance: 'dayAndTime',
          displayFormat: 'MMM d, yyyy h:mm a',
        },
        description: 'End date of validity period',
      },
    },
    {
      name: 'note',
      type: 'textarea',
      admin: {
        description: 'Additional notes about this bundle',
      },
    },
    {
      name: 'consumer',
      type: 'relationship',
      relationTo: COLLECTIONS.CONSUMER as any,
      required: true,
      index: true,
      admin: {
        description: 'Consumer who owns this bundle',
      },
    },
    {
      name: 'parentBundle',
      type: 'relationship',
      relationTo: COLLECTIONS.BUNDLE as any,
      admin: {
        description: 'Parent bundle if this is a child bundle',
      },
    },
    {
      name: 'childBundles',
      type: 'relationship',
      relationTo: COLLECTIONS.BUNDLE as any,
      hasMany: true,
      admin: {
        description: 'Child bundles derived from this bundle',
        readOnly: true,
      },
    },
    {
      name: 'usageEvents',
      type: 'relationship',
      relationTo: COLLECTIONS.BUNDLE_USAGE_EVENT as any,
      hasMany: true,
      admin: {
        description: 'Usage events for this bundle',
        readOnly: true,
      },
    },
    {
      name: 'reservations',
      type: 'relationship',
      relationTo: COLLECTIONS.RESERVATION as any,
      hasMany: true,
      admin: {
        description: 'Reservations made with this bundle',
        readOnly: true,
      },
    },
  ],
  timestamps: true,
}
