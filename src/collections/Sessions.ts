import type { CollectionConfig } from 'payload'
import { COLLECTIONS } from '../constants/collections'
import { SessionStatus } from '../constants/enums'

export const Sessions: CollectionConfig = {
  slug: COLLECTIONS.SESSION,
  admin: {
    useAsTitle: 'id',
    defaultColumns: ['sessionType', 'timeSlot', 'status', 'createdAt'],
  },
  access: {
    read: () => true,
    create: () => true,
    update: () => true,
    delete: () => true,
  },
  fields: [
    {
      name: 'sessionType',
      type: 'relationship',
      relationTo: COLLECTIONS.SESSION_TYPE as any,
      required: true,
      index: true,
      admin: {
        description: 'Type of session',
      },
    },
    {
      name: 'timeSlot',
      type: 'relationship',
      relationTo: COLLECTIONS.TIME_SLOT as any,
      required: true,
      index: true,
      admin: {
        description: 'Time slot for this session',
      },
    },
    {
      name: 'status',
      type: 'select',
      required: true,
      options: Object.values(SessionStatus),
      defaultValue: SessionStatus.SCHEDULED,
      index: true,
      admin: {
        description: 'Current status of the session',
      },
    },
    {
      name: 'reservations',
      type: 'relationship',
      relationTo: COLLECTIONS.RESERVATION as any,
      hasMany: true,
      admin: {
        description: 'Individual reservations associated with this session',
      },
    },
    {
      name: 'groupReservation',
      type: 'relationship',
      relationTo: COLLECTIONS.GROUP_RESERVATION as any,
      admin: {
        description: 'Group reservation associated with this session (if any)',
      },
    },
    {
      name: 'sessionConsumers',
      type: 'relationship',
      relationTo: COLLECTIONS.SESSION_CONSUMER as any,
      hasMany: true,
      admin: {
        description: 'Consumers who attended this session',
      },
    },
    {
      name: 'agents',
      type: 'relationship',
      relationTo: COLLECTIONS.AGENT as any,
      hasMany: true,
      admin: {
        description: 'Agents who conducted this session',
      },
    },
    {
      name: 'altAgents',
      type: 'relationship',
      relationTo: COLLECTIONS.ALT_SESSION_AGENT as any,
      hasMany: true,
      admin: {
        description: 'Alternative agents who participated in this session',
      },
    },
    {
      name: 'startedAt',
      type: 'date',
      admin: {
        date: {
          pickerAppearance: 'dayAndTime',
        },
        description: 'When the session actually started',
      },
    },
    {
      name: 'endedAt',
      type: 'date',
      admin: {
        date: {
          pickerAppearance: 'dayAndTime',
        },
        description: 'When the session actually ended',
      },
    },
    {
      name: 'note',
      type: 'textarea',
      admin: {
        description: 'Additional notes about this session',
      },
    },
  ],
  timestamps: true,
}
