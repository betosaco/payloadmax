import type { CollectionConfig } from 'payload'
import { COLLECTIONS } from '../constants/collections'
import { AgentStatus } from '../constants/enums'

export const Agents: CollectionConfig = {
  slug: COLLECTIONS.AGENT,
  admin: {
    useAsTitle: 'name',
    defaultColumns: ['name', 'status', 'createdAt'],
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
      name: 'status',
      type: 'select',
      required: true,
      options: Object.values(AgentStatus),
      defaultValue: AgentStatus.ACTIVE,
      index: true,
    },
    {
      name: 'sessionTypes',
      type: 'relationship',
      relationTo: COLLECTIONS.SESSION_TYPE as any,
      hasMany: true,
      admin: {
        description: 'Session types this agent can provide',
      },
    },
  ],
  timestamps: true,
}
