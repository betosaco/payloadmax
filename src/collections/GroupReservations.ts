import type { CollectionConfig } from 'payload'
import { COLLECTIONS } from '../constants/collections'
import { GroupReservationStatus } from '../constants/enums'

export const GroupReservations: CollectionConfig = {
  slug: COLLECTIONS.GROUP_RESERVATION,
  admin: {
    useAsTitle: 'id',
    defaultColumns: ['name', 'sessionType', 'timeSlot', 'status', 'createdAt'],
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
      admin: {
        description: 'Name of the group reservation',
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
      options: Object.values(GroupReservationStatus),
      defaultValue: GroupReservationStatus.PENDING,
      index: true,
      admin: {
        description: 'Current status of the group reservation',
      },
    },
    {
      name: 'reservations',
      type: 'relationship',
      relationTo: COLLECTIONS.RESERVATION as any,
      hasMany: true,
      admin: {
        description: 'Individual reservations that are part of this group',
      },
    },
    {
      name: 'session',
      type: 'relationship',
      relationTo: COLLECTIONS.SESSION as any,
      admin: {
        description: 'Session created from this group reservation (if any)',
      },
    },
    {
      name: 'maxParticipants',
      type: 'number',
      min: 1,
      admin: {
        description: 'Maximum number of participants allowed in this group',
      },
    },
    {
      name: 'note',
      type: 'textarea',
      admin: {
        description: 'Additional notes about this group reservation',
      },
    },
  ],
  timestamps: true,
}
