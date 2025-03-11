import type { CollectionConfig } from 'payload'
import { COLLECTIONS } from '../constants/collections'

export const AltSessionAgents: CollectionConfig = {
  slug: COLLECTIONS.ALT_SESSION_AGENT,
  admin: {
    useAsTitle: 'name',
    defaultColumns: ['name', 'email', 'session', 'createdAt'],
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
        description: 'Name of the alternative agent',
      },
    },
    {
      name: 'email',
      type: 'email',
      required: true,
      admin: {
        description: 'Email of the alternative agent',
      },
    },
    {
      name: 'session',
      type: 'relationship',
      relationTo: COLLECTIONS.SESSION as any,
      required: true,
      index: true,
      admin: {
        description: 'Session this alternative agent participated in',
      },
    },
    {
      name: 'role',
      type: 'text',
      admin: {
        description: 'Role of the alternative agent in the session',
      },
    },
    {
      name: 'note',
      type: 'textarea',
      admin: {
        description: 'Additional notes about this alternative agent',
      },
    },
  ],
  timestamps: true,
}
