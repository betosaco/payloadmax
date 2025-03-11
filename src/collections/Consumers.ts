import type { CollectionConfig } from 'payload'
import { COLLECTIONS } from '../constants/collections'
import { ConsumerStatus } from '../constants/enums'

export const Consumers: CollectionConfig = {
  slug: COLLECTIONS.CONSUMER,
  admin: {
    useAsTitle: 'email',
    defaultColumns: ['firstName', 'lastName', 'email', 'status', 'createdAt'],
  },
  access: {
    read: () => true,
    create: () => true,
    update: () => true,
    delete: () => true,
  },
  fields: [
    {
      name: 'firstName',
      type: 'text',
      required: true,
      index: true,
    },
    {
      name: 'lastName',
      type: 'text',
      required: true,
      index: true,
    },
    {
      name: 'email',
      type: 'email',
      required: true,
      unique: true,
      index: true,
    },
    {
      name: 'phoneNumber',
      type: 'text',
      admin: {
        description: 'Phone number in international format',
      },
    },
    {
      name: 'dateOfBirth',
      type: 'date',
      admin: {
        date: {
          pickerAppearance: 'dayOnly',
          displayFormat: 'MMM d, yyyy',
        },
      },
    },
    {
      name: 'status',
      type: 'select',
      required: true,
      options: Object.values(ConsumerStatus),
      defaultValue: ConsumerStatus.ACTIVE,
      index: true,
    },
    {
      name: 'isDeleted',
      type: 'checkbox',
      defaultValue: false,
      admin: {
        position: 'sidebar',
        description: 'Soft delete flag',
      },
    },
    {
      name: 'deletedAt',
      type: 'date',
      admin: {
        position: 'sidebar',
        date: {
          pickerAppearance: 'dayAndTime',
          displayFormat: 'MMM d, yyyy h:mm a',
        },
        condition: (data: { isDeleted?: boolean }) => Boolean(data?.isDeleted),
      },
    },
    {
      name: 'tags',
      type: 'relationship',
      relationTo: COLLECTIONS.TAG as any,
      hasMany: true,
      admin: {
        description: 'Tags associated with this consumer',
      },
    },
    {
      name: 'address',
      type: 'relationship',
      relationTo: COLLECTIONS.ADDRESS as any,
      admin: {
        description: 'Primary address for this consumer',
      },
    },
  ],
  timestamps: true,
}
