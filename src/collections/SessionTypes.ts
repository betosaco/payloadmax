import type { CollectionConfig } from 'payload'
import { COLLECTIONS } from '../constants/collections'

export const SessionTypes: CollectionConfig = {
  slug: COLLECTIONS.SESSION_TYPE,
  admin: {
    useAsTitle: 'name',
    defaultColumns: [
      'name',
      'minAgents',
      'maxAgents',
      'minConsumers',
      'maxConsumers',
      'defaultDuration',
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
      name: 'name',
      type: 'text',
      required: true,
      index: true,
    },
    {
      name: 'minAgents',
      type: 'number',
      required: true,
      min: 1,
      defaultValue: 1,
      admin: {
        description: 'Minimum number of agents required for this session type',
      },
    },
    {
      name: 'maxAgents',
      type: 'number',
      required: true,
      min: 1,
      defaultValue: 1,
      admin: {
        description: 'Maximum number of agents allowed for this session type',
      },
    },
    {
      name: 'minConsumers',
      type: 'number',
      required: true,
      min: 1,
      defaultValue: 1,
      admin: {
        description: 'Minimum number of consumers required for this session type',
      },
    },
    {
      name: 'maxConsumers',
      type: 'number',
      required: true,
      min: 1,
      defaultValue: 1,
      admin: {
        description: 'Maximum number of consumers allowed for this session type',
      },
    },
    {
      name: 'defaultDuration',
      type: 'number',
      required: true,
      min: 1,
      defaultValue: 60,
      admin: {
        description: 'Default duration in minutes',
      },
    },
    {
      name: 'description',
      type: 'textarea',
      admin: {
        description: 'Detailed description of this session type',
      },
    },
  ],
  timestamps: true,
}
