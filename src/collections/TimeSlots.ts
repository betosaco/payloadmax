import type { CollectionConfig } from 'payload'
import { COLLECTIONS } from '../constants/collections'

export const TimeSlots: CollectionConfig = {
  slug: COLLECTIONS.TIME_SLOT,
  admin: {
    useAsTitle: 'cron',
    defaultColumns: [
      'cron',
      'sessionType',
      'context',
      'agent',
      'isRecurring',
      'startYear',
      'endYear',
    ],
  },
  access: {
    read: () => true,
    create: () => true,
    update: () => true,
    delete: () => true,
  },
  fields: [
    {
      name: 'cron',
      type: 'text',
      required: true,
      admin: {
        description:
          'Cron expression for recurring time slots (e.g., "0 9 * * 1" for every Monday at 9 AM)',
      },
    },
    {
      name: 'startYear',
      type: 'number',
      required: true,
      min: 2000,
      max: 2100,
      defaultValue: new Date().getFullYear(),
      admin: {
        description: 'Start year for this time slot',
      },
    },
    {
      name: 'endYear',
      type: 'number',
      required: true,
      min: 2000,
      max: 2100,
      defaultValue: new Date().getFullYear() + 1,
      admin: {
        description: 'End year for this time slot',
      },
    },
    {
      name: 'isRecurring',
      type: 'checkbox',
      required: true,
      defaultValue: true,
      admin: {
        description: 'Whether this time slot recurs according to the cron expression',
      },
    },
    {
      name: 'agent',
      type: 'relationship',
      relationTo: COLLECTIONS.AGENT as any,
      admin: {
        description: 'Specific agent assigned to this time slot (optional)',
      },
    },
    {
      name: 'context',
      type: 'relationship',
      relationTo: COLLECTIONS.CONTEXT as any,
      required: true,
      index: true,
      admin: {
        description: 'Context for this time slot',
      },
    },
    {
      name: 'sessionType',
      type: 'relationship',
      relationTo: COLLECTIONS.SESSION_TYPE as any,
      required: true,
      index: true,
      admin: {
        description: 'Type of session for this time slot',
      },
    },
    {
      name: 'duration',
      type: 'number',
      min: 1,
      admin: {
        description: 'Duration in minutes (overrides session type default if specified)',
      },
    },
    {
      name: 'description',
      type: 'textarea',
      admin: {
        description: 'Additional notes about this time slot',
      },
    },
  ],
  timestamps: true,
}
