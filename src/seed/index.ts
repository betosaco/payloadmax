import { Payload } from 'payload'
import { CollectionConfig } from 'payload/types'
import { COLLECTIONS } from '../constants/collections'
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
} from '../constants/enums'

// Helper function to add hours to a date
const addHours = (date: Date, hours: number): Date => {
  const result = new Date(date)
  result.setHours(result.getHours() + hours)
  return result
}

// Helper function to add days to a date
const addDays = (date: Date, days: number): Date => {
  const result = new Date(date)
  result.setDate(result.getDate() + days)
  return result
}

// Type for document with ID
interface WithId {
  id: string | number
}

export const seed = async (payload: Payload): Promise<void> => {
  // Clear existing data (optional - uncomment if needed)
  // await clearData(payload);

  // Seed Tenants
  const tenant = await seedTenants(payload)

  // Seed Agencies
  const agency = await seedAgencies(payload, tenant.id)

  // Seed Agents
  const agent = await seedAgents(payload)

  // Seed Consumers
  const consumer = await seedConsumers(payload)

  // Seed SessionTypes
  const sessionType = await seedSessionTypes(payload)

  // Seed Contexts
  const context = await seedContexts(payload, agency.id)

  // Seed TimeSlots
  const timeSlot = await seedTimeSlots(payload, context.id, sessionType.id, agent.id)

  // Seed Allocations
  const allocation = await seedAllocations(payload, timeSlot.id)

  // Seed Bundles
  const bundle = await seedBundles(payload, consumer.id)

  // Seed Reservations
  const reservation = await seedReservations(
    payload,
    consumer.id,
    sessionType.id,
    timeSlot.id,
    bundle.id,
  )

  // Seed BundleUsageEvents
  await seedBundleUsageEvents(payload, bundle.id, reservation.id)

  // Seed GroupReservations
  const groupReservation = await seedGroupReservations(payload, sessionType.id, timeSlot.id)

  // Seed Sessions
  const session = await seedSessions(
    payload,
    sessionType.id,
    timeSlot.id,
    [agent.id],
    reservation.id,
    groupReservation.id,
  )

  // Seed SessionConsumers
  await seedSessionConsumers(payload, session.id, consumer.id, reservation.id)

  // Seed AltSessionAgents
  await seedAltSessionAgents(payload, session.id)

  // Seed Tags
  const tag = await seedTags(payload)

  // Seed Addresses
  const address = await seedAddresses(payload)

  // Seed AgentSessionTypeAgencies
  await seedAgentSessionTypeAgencies(payload, agent.id, sessionType.id, agency.id)

  console.log('✅ Seed completed successfully!')
}

// Individual seed functions

async function seedTenants(payload: Payload): Promise<WithId> {
  const tenant = await payload.create({
    collection: COLLECTIONS.TENANT as any,
    data: {
      name: 'MatPass Demo Tenant',
      url: 'https://matpass.demo',
    },
  })

  console.log(`Created tenant: ${tenant.id}`)
  return tenant
}

async function seedAgencies(payload: Payload, tenantId: string | number): Promise<WithId> {
  const agency = await payload.create({
    collection: COLLECTIONS.AGENCY as any,
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

async function seedAgents(payload: Payload): Promise<WithId> {
  const agent = await payload.create({
    collection: COLLECTIONS.AGENT as any,
    data: {
      name: 'John Doe',
      status: AgentStatus.ACTIVE,
    },
  })

  console.log(`Created agent: ${agent.id}`)
  return agent
}

async function seedConsumers(payload: Payload): Promise<WithId> {
  const consumer = await payload.create({
    collection: COLLECTIONS.CONSUMER as any,
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

async function seedSessionTypes(payload: Payload): Promise<WithId> {
  const sessionType = await payload.create({
    collection: COLLECTIONS.SESSION_TYPE as any,
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

async function seedContexts(payload: Payload, agencyId: string | number): Promise<WithId> {
  const context = await payload.create({
    collection: COLLECTIONS.CONTEXT as any,
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

async function seedTimeSlots(
  payload: Payload,
  contextId: string | number,
  sessionTypeId: string | number,
  agentId: string | number,
): Promise<WithId> {
  const timeSlot = await payload.create({
    collection: COLLECTIONS.TIME_SLOT as any,
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

async function seedAllocations(payload: Payload, timeSlotId: string | number): Promise<WithId> {
  const now = new Date()
  const startTime = addDays(now, 1)
  startTime.setHours(9, 0, 0, 0) // 9 AM tomorrow

  const endTime = new Date(startTime)
  endTime.setHours(10, 0, 0, 0) // 10 AM tomorrow

  const allocation = await payload.create({
    collection: COLLECTIONS.ALLOCATION as any,
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

async function seedBundles(payload: Payload, consumerId: string | number): Promise<WithId> {
  const now = new Date()
  const validFrom = now.toISOString()
  const validTo = addDays(now, 90).toISOString() // Valid for 90 days

  const bundle = await payload.create({
    collection: COLLECTIONS.BUNDLE as any,
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

async function seedReservations(
  payload: Payload,
  consumerId: string | number,
  sessionTypeId: string | number,
  timeSlotId: string | number,
  bundleId: string | number,
): Promise<WithId> {
  const reservation = await payload.create({
    collection: COLLECTIONS.RESERVATION as any,
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

async function seedBundleUsageEvents(
  payload: Payload,
  bundleId: string | number,
  reservationId: string | number,
): Promise<WithId> {
  const bundleUsageEvent = await payload.create({
    collection: COLLECTIONS.BUNDLE_USAGE_EVENT as any,
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

async function seedGroupReservations(
  payload: Payload,
  sessionTypeId: string | number,
  timeSlotId: string | number,
): Promise<WithId> {
  const groupReservation = await payload.create({
    collection: COLLECTIONS.GROUP_RESERVATION as any,
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
  payload: Payload,
  sessionTypeId: string | number,
  timeSlotId: string | number,
  agentIds: (string | number)[],
  reservationId: string | number,
  groupReservationId: string | number,
): Promise<WithId> {
  const now = new Date()
  const startedAt = addDays(now, 1)
  startedAt.setHours(9, 0, 0, 0) // 9 AM tomorrow

  const endedAt = new Date(startedAt)
  endedAt.setHours(10, 0, 0, 0) // 10 AM tomorrow

  const session = await payload.create({
    collection: COLLECTIONS.SESSION as any,
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

async function seedSessionConsumers(
  payload: Payload,
  sessionId: string | number,
  consumerId: string | number,
  reservationId: string | number,
): Promise<WithId> {
  const now = new Date()
  const checkedInAt = addDays(now, 1)
  checkedInAt.setHours(9, 0, 0, 0) // 9 AM tomorrow

  const checkedOutAt = new Date(checkedInAt)
  checkedOutAt.setHours(10, 0, 0, 0) // 10 AM tomorrow

  const sessionConsumer = await payload.create({
    collection: COLLECTIONS.SESSION_CONSUMER as any,
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

async function seedAltSessionAgents(payload: Payload, sessionId: string | number): Promise<WithId> {
  const altSessionAgent = await payload.create({
    collection: COLLECTIONS.ALT_SESSION_AGENT as any,
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

async function seedTags(payload: Payload): Promise<WithId> {
  const tag = await payload.create({
    collection: COLLECTIONS.TAG as any,
    data: {
      name: 'High Priority',
      category: 'Priority',
      description: 'Consumers who need immediate attention',
    },
  })

  console.log(`Created tag: ${tag.id}`)
  return tag
}

async function seedAddresses(payload: Payload): Promise<WithId> {
  const address = await payload.create({
    collection: COLLECTIONS.ADDRESS as any,
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

async function seedAgentSessionTypeAgencies(
  payload: Payload,
  agentId: string | number,
  sessionTypeId: string | number,
  agencyId: string | number,
): Promise<WithId> {
  const now = new Date()
  const startDate = now.toISOString().split('T')[0] // Today's date

  const agentSessionTypeAgency = await payload.create({
    collection: COLLECTIONS.AGENT_SESSION_TYPE_AGENCY as any,
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
async function clearData(payload: Payload): Promise<void> {
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
      collection: collection as any,
      limit: 1000,
    })

    for (const doc of docs.docs) {
      await payload.delete({
        collection: collection as any,
        id: doc.id,
      })
    }

    console.log(`Cleared collection: ${collection}`)
  }
}
