/**
 * Payload seed script for MatPass collections
 *
 * Run with: npx payload run src/seed/payload-seed.js
 */

import {
  AgencyStatus,
  AgentStatus,
  AllocationStatus,
  BundleStatus,
  BundleUsageEventType,
  ConsumerStatus,
  GroupReservationStatus,
  ReservationStatus,
  SessionStatus,
  SessionConsumerStatus,
} from './enums.js'

import { COLLECTIONS } from './collections.js'

// Helper function to add hours to a date
const addHours = (date, hours) => {
  const result = new Date(date)
  result.setHours(result.getHours() + hours)
  return result
}

// Helper function to add days to a date
const addDays = (date, days) => {
  const result = new Date(date)
  result.setDate(result.getDate() + days)
  return result
}

export default async (payload) => {
  console.log('Starting seed process...')
  console.log('Payload instance available:', Boolean(payload))

  // Log available collections
  if (payload && payload.collections) {
    console.log('Available collections:')
    console.dir(Object.keys(payload.collections), { depth: null })
  } else {
    console.log('No collections available')
  }

  // Log available methods
  console.log('Available payload methods:')
  console.dir(Object.keys(payload || {}), { depth: null })

  try {
    // Try to create a simple document in the first available collection
    if (payload && payload.collections) {
      const collectionNames = Object.keys(payload.collections)
      if (collectionNames.length > 0) {
        const firstCollection = collectionNames[0]
        console.log(`Trying to create a document in ${firstCollection}...`)

        const doc = await payload.create({
          collection: firstCollection,
          data: {
            name: 'Test Document',
            createdAt: new Date().toISOString(),
          },
        })

        console.log(`Created document: ${doc.id}`)
      }
    }

    console.log('✅ Seed completed successfully!')
  } catch (error) {
    console.error('❌ Error seeding database:', error)
    throw error
  }
}

// Individual seed functions

async function seedTenants(payload) {
  const tenant = await payload.create({
    collection: COLLECTIONS.TENANT,
    data: {
      name: 'MatPass Demo Tenant',
      url: 'https://matpass.demo',
    },
  })

  console.log(`Created tenant: ${tenant.id}`)
  return tenant
}

async function seedAgencies(payload, tenantId) {
  const agency = await payload.create({
    collection: COLLECTIONS.AGENCY,
    data: {
      name: 'MatPass Demo Agency',
      status: AgencyStatus.ACTIVE,
      address: '123 Main St, San Francisco, CA 94105',
      timezone: 'America/Los_Angeles',
      tenant: tenantId,
    },
  })

  console.log(`Created agency: ${agency.id}`)
  return agency
}

async function seedAgents(payload) {
  const agent = await payload.create({
    collection: COLLECTIONS.AGENT,
    data: {
      name: 'John Doe',
      status: AgentStatus.ACTIVE,
    },
  })

  console.log(`Created agent: ${agent.id}`)
  return agent
}

async function seedConsumers(payload) {
  const consumer = await payload.create({
    collection: COLLECTIONS.CONSUMER,
    data: {
      firstName: 'Jane',
      lastName: 'Smith',
      email: 'jane.smith@example.com',
      phoneNumber: '+14155551234',
      dateOfBirth: '1990-01-01',
      status: ConsumerStatus.ACTIVE,
    },
  })

  console.log(`Created consumer: ${consumer.id}`)
  return consumer
}

async function seedSessionTypes(payload) {
  const sessionType = await payload.create({
    collection: COLLECTIONS.SESSION_TYPE,
    data: {
      name: 'Individual Therapy',
      minAgents: 1,
      maxAgents: 1,
      minConsumers: 1,
      maxConsumers: 1,
      defaultDuration: 60,
      description: 'One-on-one therapy session',
    },
  })

  console.log(`Created session type: ${sessionType.id}`)
  return sessionType
}

async function seedContexts(payload, agencyId) {
  const context = await payload.create({
    collection: COLLECTIONS.CONTEXT,
    data: {
      name: 'Virtual Sessions',
      agency: agencyId,
      defaultBufferTime: 15,
      defaultMaxCapacity: 10,
      description: 'Context for virtual therapy sessions',
    },
  })

  console.log(`Created context: ${context.id}`)
  return context
}

async function seedTimeSlots(payload, contextId, sessionTypeId, agentId) {
  const timeSlot = await payload.create({
    collection: COLLECTIONS.TIME_SLOT,
    data: {
      cron: '0 9 * * 1-5', // 9 AM Monday-Friday
      startYear: new Date().getFullYear(),
      endYear: new Date().getFullYear() + 1,
      isRecurring: true,
      agent: agentId,
      context: contextId,
      sessionType: sessionTypeId,
      duration: 60,
      description: 'Morning therapy sessions',
    },
  })

  console.log(`Created time slot: ${timeSlot.id}`)
  return timeSlot
}

async function seedAllocations(payload, timeSlotId) {
  const now = new Date()
  const startTime = addDays(now, 1)
  startTime.setHours(9, 0, 0, 0) // 9 AM tomorrow

  const endTime = new Date(startTime)
  endTime.setHours(10, 0, 0, 0) // 10 AM tomorrow

  const allocation = await payload.create({
    collection: COLLECTIONS.ALLOCATION,
    data: {
      startTime: startTime.toISOString(),
      endTime: endTime.toISOString(),
      status: AllocationStatus.AVAILABLE,
      timeSlot: timeSlotId,
      currentReservations: 0,
      version: 1,
      note: 'Available for booking',
    },
  })

  console.log(`Created allocation: ${allocation.id}`)
  return allocation
}

async function seedBundles(payload, consumerId) {
  const now = new Date()
  const validFrom = now.toISOString()
  const validTo = addDays(now, 90).toISOString() // Valid for 90 days

  const bundle = await payload.create({
    collection: COLLECTIONS.BUNDLE,
    data: {
      status: BundleStatus.ACTIVE,
      validFrom,
      validTo,
      consumer: consumerId,
      note: 'Standard therapy package',
    },
  })

  console.log(`Created bundle: ${bundle.id}`)
  return bundle
}

async function seedReservations(payload, consumerId, sessionTypeId, timeSlotId, bundleId) {
  const reservation = await payload.create({
    collection: COLLECTIONS.RESERVATION,
    data: {
      consumer: consumerId,
      sessionType: sessionTypeId,
      timeSlot: timeSlotId,
      status: ReservationStatus.CONFIRMED,
      bundle: bundleId,
      note: 'Regular weekly session',
    },
  })

  console.log(`Created reservation: ${reservation.id}`)
  return reservation
}

async function seedBundleUsageEvents(payload, bundleId, reservationId) {
  const bundleUsageEvent = await payload.create({
    collection: COLLECTIONS.BUNDLE_USAGE_EVENT,
    data: {
      bundle: bundleId,
      reservation: reservationId,
      type: BundleUsageEventType.USE,
      quantity: 1,
      note: 'Used one session credit',
    },
  })

  console.log(`Created bundle usage event: ${bundleUsageEvent.id}`)
  return bundleUsageEvent
}

async function seedGroupReservations(payload, sessionTypeId, timeSlotId) {
  const groupReservation = await payload.create({
    collection: COLLECTIONS.GROUP_RESERVATION,
    data: {
      name: 'Group Therapy Session',
      sessionType: sessionTypeId,
      timeSlot: timeSlotId,
      status: GroupReservationStatus.CONFIRMED,
      maxParticipants: 8,
      note: 'Weekly group therapy',
    },
  })

  console.log(`Created group reservation: ${groupReservation.id}`)
  return groupReservation
}

async function seedSessions(
  payload,
  sessionTypeId,
  timeSlotId,
  agentIds,
  reservationId,
  groupReservationId,
) {
  const now = new Date()
  const startedAt = addDays(now, 1)
  startedAt.setHours(9, 0, 0, 0) // 9 AM tomorrow

  const endedAt = new Date(startedAt)
  endedAt.setHours(10, 0, 0, 0) // 10 AM tomorrow

  const session = await payload.create({
    collection: COLLECTIONS.SESSION,
    data: {
      sessionType: sessionTypeId,
      timeSlot: timeSlotId,
      status: SessionStatus.SCHEDULED,
      reservations: [reservationId],
      groupReservation: groupReservationId,
      agents: agentIds,
      startedAt: startedAt.toISOString(),
      endedAt: endedAt.toISOString(),
      note: 'Regular therapy session',
    },
  })

  console.log(`Created session: ${session.id}`)
  return session
}

async function seedSessionConsumers(payload, sessionId, consumerId, reservationId) {
  const now = new Date()
  const checkedInAt = addDays(now, 1)
  checkedInAt.setHours(9, 0, 0, 0) // 9 AM tomorrow

  const checkedOutAt = new Date(checkedInAt)
  checkedOutAt.setHours(10, 0, 0, 0) // 10 AM tomorrow

  const sessionConsumer = await payload.create({
    collection: COLLECTIONS.SESSION_CONSUMER,
    data: {
      session: sessionId,
      consumer: consumerId,
      reservation: reservationId,
      status: SessionConsumerStatus.ATTENDED,
      checkedInAt: checkedInAt.toISOString(),
      checkedOutAt: checkedOutAt.toISOString(),
      note: 'Attended full session',
    },
  })

  console.log(`Created session consumer: ${sessionConsumer.id}`)
  return sessionConsumer
}

async function seedAltSessionAgents(payload, sessionId) {
  const altSessionAgent = await payload.create({
    collection: COLLECTIONS.ALT_SESSION_AGENT,
    data: {
      name: 'Dr. Sarah Johnson',
      email: 'sarah.johnson@example.com',
      session: sessionId,
      role: 'Supervisor',
      note: 'Observing session for training purposes',
    },
  })

  console.log(`Created alt session agent: ${altSessionAgent.id}`)
  return altSessionAgent
}

async function seedTags(payload) {
  const tag = await payload.create({
    collection: COLLECTIONS.TAG,
    data: {
      name: 'High Priority',
      category: 'Priority',
      description: 'Consumers who need immediate attention',
    },
  })

  console.log(`Created tag: ${tag.id}`)
  return tag
}

async function seedAddresses(payload) {
  const address = await payload.create({
    collection: COLLECTIONS.ADDRESS,
    data: {
      line1: '123 Main St',
      city: 'San Francisco',
      state: 'CA',
      postalCode: '94105',
      country: 'USA',
      isVerified: true,
    },
  })

  console.log(`Created address: ${address.id}`)
  return address
}

async function seedAgentSessionTypeAgencies(payload, agentId, sessionTypeId, agencyId) {
  const now = new Date()
  const startDate = now.toISOString().split('T')[0] // Today's date

  const agentSessionTypeAgency = await payload.create({
    collection: COLLECTIONS.AGENT_SESSION_TYPE_AGENCY,
    data: {
      agent: agentId,
      sessionType: sessionTypeId,
      agency: agencyId,
      isActive: true,
      startDate,
      note: 'Primary assignment',
    },
  })

  console.log(`Created agent session type agency: ${agentSessionTypeAgency.id}`)
  return agentSessionTypeAgency
}

// Helper function to clear all data (optional)
async function clearData(payload) {
  const collections = [
    COLLECTIONS.TENANT,
    COLLECTIONS.AGENCY,
    COLLECTIONS.AGENT,
    COLLECTIONS.CONSUMER,
    COLLECTIONS.SESSION_TYPE,
    COLLECTIONS.CONTEXT,
    COLLECTIONS.TIME_SLOT,
    COLLECTIONS.ALLOCATION,
    COLLECTIONS.BUNDLE,
    COLLECTIONS.BUNDLE_USAGE_EVENT,
    COLLECTIONS.RESERVATION,
    COLLECTIONS.GROUP_RESERVATION,
    COLLECTIONS.SESSION,
    COLLECTIONS.SESSION_CONSUMER,
    COLLECTIONS.ALT_SESSION_AGENT,
    COLLECTIONS.TAG,
    COLLECTIONS.ADDRESS,
    COLLECTIONS.AGENT_SESSION_TYPE_AGENCY,
  ]

  for (const collection of collections) {
    const docs = await payload.find({
      collection,
      limit: 1000,
    })

    for (const doc of docs.docs) {
      await payload.delete({
        collection,
        id: doc.id,
      })
    }

    console.log(`Cleared collection: ${collection}`)
  }
}
