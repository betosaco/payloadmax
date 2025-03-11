import type { CollectionConfig } from 'payload'
import { COLLECTIONS } from '../constants/collections'
import { SessionConsumerStatus } from '../constants/enums'

export const SessionConsumers: CollectionConfig = {
  slug: COLLECTIONS.SESSION_CONSUMER,
  admin: {
    useAsTitle: 'id',
    defaultColumns: ['session', 'consumer', 'status', 'createdAt'],
  },
  access: {
    read: () => true,
    create: () => true,
    update: () => true,
    delete: () => true,
  },
  fields: [
    {
      name: 'session',
      type: 'relationship',
      relationTo: COLLECTIONS.SESSION as any,
      required: true,
      index: true,
      admin: {
        description: 'Session this consumer attended',
      },
    },
    {
      name: 'consumer',
      type: 'relationship',
      relationTo: COLLECTIONS.CONSUMER as any,
      required: true,
      index: true,
      admin: {
        description: 'Consumer who attended the session',
      },
    },
    {
      name: 'reservation',
      type: 'relationship',
      relationTo: COLLECTIONS.RESERVATION as any,
      admin: {
        description: 'Reservation associated with this attendance (if any)',
      },
    },
    {
      name: 'status',
      type: 'select',
      required: true,
      options: Object.values(SessionConsumerStatus),
      defaultValue: SessionConsumerStatus.ATTENDED,
      index: true,
      admin: {
        description: 'Status of the consumer for this session',
      },
    },
    {
      name: 'checkedInAt',
      type: 'date',
      admin: {
        date: {
          pickerAppearance: 'dayAndTime',
        },
        description: 'When the consumer checked in for the session',
      },
    },
    {
      name: 'checkedOutAt',
      type: 'date',
      admin: {
        date: {
          pickerAppearance: 'dayAndTime',
        },
        description: 'When the consumer checked out from the session',
      },
    },
    {
      name: 'note',
      type: 'textarea',
      admin: {
        description: "Additional notes about this consumer's attendance",
      },
    },
  ],
  timestamps: true,
}
