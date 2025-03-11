import type { CollectionConfig } from 'payload'
import { COLLECTIONS } from '../constants/collections'
import { ReservationStatus } from '../constants/enums'

export const Reservations: CollectionConfig = {
  slug: COLLECTIONS.RESERVATION,
  admin: {
    useAsTitle: 'id',
    defaultColumns: ['consumer', 'sessionType', 'timeSlot', 'status', 'createdAt'],
  },
  access: {
    read: () => true,
    create: () => true,
    update: () => true,
    delete: () => true,
  },
  fields: [
    {
      name: 'consumer',
      type: 'relationship',
      relationTo: COLLECTIONS.CONSUMER as any,
      required: true,
      index: true,
      admin: {
        description: 'Consumer who made this reservation',
      },
    },
    {
      name: 'sessionType',
      type: 'relationship',
      relationTo: COLLECTIONS.SESSION_TYPE as any,
      required: true,
      index: true,
      admin: {
        description: 'Type of session being reserved',
      },
    },
    {
      name: 'timeSlot',
      type: 'relationship',
      relationTo: COLLECTIONS.TIME_SLOT as any,
      required: true,
      index: true,
      admin: {
        description: 'Time slot being reserved',
      },
    },
    {
      name: 'status',
      type: 'select',
      required: true,
      options: Object.values(ReservationStatus),
      defaultValue: ReservationStatus.PENDING,
      index: true,
      admin: {
        description: 'Current status of the reservation',
      },
    },
    {
      name: 'bundle',
      type: 'relationship',
      relationTo: COLLECTIONS.BUNDLE as any,
      index: true,
      admin: {
        description: 'Bundle used for this reservation (if applicable)',
      },
    },
    {
      name: 'usageEvents',
      type: 'relationship',
      relationTo: COLLECTIONS.BUNDLE_USAGE_EVENT as any,
      hasMany: true,
      admin: {
        description: 'Bundle usage events associated with this reservation',
      },
    },
    {
      name: 'session',
      type: 'relationship',
      relationTo: COLLECTIONS.SESSION as any,
      admin: {
        description: 'Session created from this reservation (if any)',
      },
    },
    {
      name: 'groupReservation',
      type: 'relationship',
      relationTo: COLLECTIONS.GROUP_RESERVATION as any,
      admin: {
        description: 'Group reservation this is part of (if any)',
      },
    },
    {
      name: 'note',
      type: 'textarea',
      admin: {
        description: 'Additional notes about this reservation',
      },
    },
  ],
  timestamps: true,
}
