import type { CollectionConfig } from 'payload'
import { COLLECTIONS } from '../constants/collections'
import { AllocationStatus } from '../constants/enums'

export const Allocations: CollectionConfig = {
  slug: COLLECTIONS.ALLOCATION,
  admin: {
    useAsTitle: 'id',
    defaultColumns: ['timeSlot', 'startTime', 'endTime', 'status', 'currentReservations'],
  },
  access: {
    read: () => true,
    create: () => true,
    update: () => true,
    delete: () => true,
  },
  fields: [
    {
      name: 'startTime',
      type: 'date',
      required: true,
      index: true,
      admin: {
        date: {
          pickerAppearance: 'dayAndTime',
          displayFormat: 'MMM d, yyyy h:mm a',
        },
        description: 'Start time of this allocation',
      },
    },
    {
      name: 'endTime',
      type: 'date',
      required: true,
      index: true,
      admin: {
        date: {
          pickerAppearance: 'dayAndTime',
          displayFormat: 'MMM d, yyyy h:mm a',
        },
        description: 'End time of this allocation',
      },
    },
    {
      name: 'status',
      type: 'select',
      required: true,
      options: Object.values(AllocationStatus),
      defaultValue: AllocationStatus.AVAILABLE,
      index: true,
      admin: {
        description: 'Current status of this allocation',
      },
    },
    {
      name: 'note',
      type: 'textarea',
      admin: {
        description: 'Additional notes about this allocation',
      },
    },
    {
      name: 'timeSlot',
      type: 'relationship',
      relationTo: COLLECTIONS.TIME_SLOT as any,
      required: true,
      index: true,
      admin: {
        description: 'Time slot that generated this allocation',
      },
    },
    {
      name: 'currentReservations',
      type: 'number',
      required: true,
      defaultValue: 0,
      min: 0,
      admin: {
        description: 'Current number of reservations for this allocation',
      },
    },
    {
      name: 'version',
      type: 'number',
      required: true,
      defaultValue: 1,
      min: 1,
      admin: {
        description: 'Version number for optimistic concurrency control',
        position: 'sidebar',
      },
    },
    {
      name: 'reservations',
      type: 'relationship',
      relationTo: COLLECTIONS.RESERVATION as any,
      hasMany: true,
      admin: {
        description: 'Reservations for this allocation',
        readOnly: true,
      },
    },
    {
      name: 'sessions',
      type: 'relationship',
      relationTo: COLLECTIONS.SESSION as any,
      hasMany: true,
      admin: {
        description: 'Sessions for this allocation',
        readOnly: true,
      },
    },
  ],
  timestamps: true,
}
