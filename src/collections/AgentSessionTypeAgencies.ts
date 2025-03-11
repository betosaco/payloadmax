import type { CollectionConfig } from 'payload'
import { COLLECTIONS } from '../constants/collections'

export const AgentSessionTypeAgencies: CollectionConfig = {
  slug: COLLECTIONS.AGENT_SESSION_TYPE_AGENCY,
  admin: {
    useAsTitle: 'id',
    defaultColumns: ['agent', 'sessionType', 'agency', 'createdAt'],
  },
  access: {
    read: () => true,
    create: () => true,
    update: () => true,
    delete: () => true,
  },
  fields: [
    {
      name: 'agent',
      type: 'relationship',
      relationTo: COLLECTIONS.AGENT as any,
      required: true,
      index: true,
      admin: {
        description: 'Agent providing the service',
      },
    },
    {
      name: 'sessionType',
      type: 'relationship',
      relationTo: COLLECTIONS.SESSION_TYPE as any,
      required: true,
      index: true,
      admin: {
        description: 'Type of session the agent can provide',
      },
    },
    {
      name: 'agency',
      type: 'relationship',
      relationTo: COLLECTIONS.AGENCY as any,
      required: true,
      index: true,
      admin: {
        description: 'Agency where the agent provides this session type',
      },
    },
    {
      name: 'isActive',
      type: 'checkbox',
      defaultValue: true,
      admin: {
        description: 'Whether this association is currently active',
      },
    },
    {
      name: 'startDate',
      type: 'date',
      admin: {
        date: {
          pickerAppearance: 'dayOnly',
        },
        description: 'When the agent started providing this session type at this agency',
      },
    },
    {
      name: 'endDate',
      type: 'date',
      admin: {
        date: {
          pickerAppearance: 'dayOnly',
        },
        description:
          'When the agent stopped providing this session type at this agency (if applicable)',
      },
    },
    {
      name: 'note',
      type: 'textarea',
      admin: {
        description: 'Additional notes about this association',
      },
    },
  ],
  timestamps: true,
}
