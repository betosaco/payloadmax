/**
 * MCP to Payload CMS Migration Script
 *
 * This script migrates data from MCP database to Payload CMS collections.
 * Run with: node src/seed/mcp-migration.js
 */

import dotenv from 'dotenv'
import path from 'path'
import { fileURLToPath } from 'url'
import pkg from 'pg'
const { Pool } = pkg
import { COLLECTIONS } from './collections.js'
import {
  AgencyStatus,
  AgentStatus,
  AllocationStatus,
  BundleStatus,
  ConsumerStatus,
  SessionStatus,
  ReservationStatus,
  GroupReservationStatus,
  SessionConsumerStatus,
} from './enums.js'

dotenv.config()

const __dirname = path.dirname(fileURLToPath(import.meta.url))

// PostgreSQL connection configuration
const pgConfig = {
  user: process.env.POSTGRES_USER || 'postgres',
  host: process.env.POSTGRES_HOST || 'localhost',
  database: process.env.POSTGRES_DATABASE || 'postgres',
  password: process.env.POSTGRES_PASSWORD || 'postgres',
  port: parseInt(process.env.POSTGRES_PORT || '5432', 10),
}

// Create a new pool instance
const pool = new Pool(pgConfig)

// Map to store original IDs to new IDs for reference relationships
const idMap = {
  tenants: {},
  agencies: {},
  agents: {},
  consumers: {},
  'session-types': {},
  'time-slots': {},
  allocations: {},
  bundles: {},
  contexts: {},
  // Add more collections as needed
}

// Get batch size from environment variables or use default
const BATCH_SIZE = parseInt(process.env.MIGRATION_BATCH_SIZE || '100', 10)

// Helper function to check if a migration is enabled
const isMigrationEnabled = (migrationName) => {
  const envVar = `MIGRATE_${migrationName.toUpperCase()}`
  return process.env[envVar] !== 'false'
}

async function main() {
  console.log('Starting MCP to Payload migration...')

  try {
    // Import payload dynamically to avoid initialization issues
    const { default: payload } = await import('payload')

    // Set the PAYLOAD_CONFIG_PATH environment variable
    const configPath = path.resolve(__dirname, '../payload.config.ts')
    console.log('Config path:', configPath)
    process.env.PAYLOAD_CONFIG_PATH = configPath

    console.log('Initializing Payload...')

    // Initialize Payload with minimal configuration
    await payload.init({
      secret: process.env.PAYLOAD_SECRET || 'matpass_migration_secret_key',
      local: true,
      onInit: async () => {
        console.log('✅ Payload CMS initialized successfully!')
      },
      email: {
        transportOptions: {
          host: 'smtp.example.com',
          auth: {
            user: 'user',
            pass: 'pass',
          },
        },
        fromName: 'Admin',
        fromAddress: 'admin@example.com',
      },
    })

    console.log('Payload initialized successfully!')

    // Start the migration process
    await migrateData(payload)

    console.log('Migration completed successfully!')
    process.exit(0)
  } catch (error) {
    console.error('Error running migration script:', error)
    process.exit(1)
  } finally {
    // Close the database pool
    await pool.end()
  }
}

async function migrateData(payload) {
  // Migrate in order of dependencies, respecting environment variable settings
  if (isMigrationEnabled('tenants')) {
    await migrateTenants(payload)
  } else {
    console.log('Skipping tenants migration (disabled in .env)')
  }

  if (isMigrationEnabled('agencies')) {
    await migrateAgencies(payload)
  } else {
    console.log('Skipping agencies migration (disabled in .env)')
  }

  if (isMigrationEnabled('agents')) {
    await migrateAgents(payload)
  } else {
    console.log('Skipping agents migration (disabled in .env)')
  }

  if (isMigrationEnabled('consumers')) {
    await migrateConsumers(payload)
  } else {
    console.log('Skipping consumers migration (disabled in .env)')
  }

  if (isMigrationEnabled('session_types')) {
    await migrateSessionTypes(payload)
  } else {
    console.log('Skipping session types migration (disabled in .env)')
  }

  if (isMigrationEnabled('contexts')) {
    await migrateContexts(payload)
  } else {
    console.log('Skipping contexts migration (disabled in .env)')
  }

  if (isMigrationEnabled('time_slots')) {
    await migrateTimeSlots(payload)
  } else {
    console.log('Skipping time slots migration (disabled in .env)')
  }

  if (isMigrationEnabled('allocations')) {
    await migrateAllocations(payload)
  } else {
    console.log('Skipping allocations migration (disabled in .env)')
  }

  if (isMigrationEnabled('bundles')) {
    await migrateBundles(payload)
  } else {
    console.log('Skipping bundles migration (disabled in .env)')
  }

  if (isMigrationEnabled('reservations')) {
    await migrateReservations(payload)
  } else {
    console.log('Skipping reservations migration (disabled in .env)')
  }

  if (isMigrationEnabled('group_reservations')) {
    await migrateGroupReservations(payload)
  } else {
    console.log('Skipping group reservations migration (disabled in .env)')
  }

  if (isMigrationEnabled('sessions')) {
    await migrateSessions(payload)
  } else {
    console.log('Skipping sessions migration (disabled in .env)')
  }

  if (isMigrationEnabled('session_consumers')) {
    await migrateSessionConsumers(payload)
  } else {
    console.log('Skipping session consumers migration (disabled in .env)')
  }

  if (isMigrationEnabled('alt_session_agents')) {
    await migrateAltSessionAgents(payload)
  } else {
    console.log('Skipping alt session agents migration (disabled in .env)')
  }

  if (isMigrationEnabled('tags')) {
    await migrateTags(payload)
  } else {
    console.log('Skipping tags migration (disabled in .env)')
  }

  if (isMigrationEnabled('addresses')) {
    await migrateAddresses(payload)
  } else {
    console.log('Skipping addresses migration (disabled in .env)')
  }

  if (isMigrationEnabled('agent_session_type_agencies')) {
    await migrateAgentSessionTypeAgencies(payload)
  } else {
    console.log('Skipping agent session type agencies migration (disabled in .env)')
  }
}

// Helper function to process data in batches
async function processBatches(rows, processFn) {
  const totalBatches = Math.ceil(rows.length / BATCH_SIZE)
  console.log(`Processing ${rows.length} records in ${totalBatches} batches of ${BATCH_SIZE}...`)

  for (let i = 0; i < rows.length; i += BATCH_SIZE) {
    const batch = rows.slice(i, i + BATCH_SIZE)
    const batchNumber = Math.floor(i / BATCH_SIZE) + 1
    console.log(`Processing batch ${batchNumber}/${totalBatches} (${batch.length} records)...`)

    await Promise.all(batch.map(processFn))

    console.log(`Completed batch ${batchNumber}/${totalBatches}`)
  }
}

async function migrateTenants(payload) {
  console.log('Migrating tenants...')

  try {
    // Query MCP database for tenants
    const { rows } = await pool.query('SELECT * FROM "Tenant"')
    console.log(`Found ${rows.length} tenants to migrate`)

    // Process tenants in batches
    await processBatches(rows, async (tenant) => {
      try {
        const newTenant = await payload.create({
          collection: COLLECTIONS.TENANT,
          data: {
            name: tenant.name,
            url: tenant.url,
          },
        })

        // Store the ID mapping for relationships
        idMap.tenants[tenant.id] = newTenant.id
        console.log(`Migrated tenant: ${tenant.name} (${tenant.id} -> ${newTenant.id})`)
      } catch (error) {
        console.error(`Error migrating tenant ${tenant.id}:`, error.message)
      }
    })
  } catch (error) {
    console.error('Error querying tenants:', error.message)
  }
}

async function migrateAgencies(payload) {
  console.log('Migrating agencies...')

  try {
    // Query MCP database for agencies
    const { rows } = await pool.query('SELECT * FROM "Agency"')
    console.log(`Found ${rows.length} agencies to migrate`)

    // Process agencies in batches
    await processBatches(rows, async (agency) => {
      try {
        // Map the tenant ID to the new ID in Payload
        const tenantId = idMap.tenants[agency.tenantId]

        if (!tenantId) {
          console.warn(`Tenant ID ${agency.tenantId} not found for agency ${agency.id}, skipping`)
          return
        }

        const newAgency = await payload.create({
          collection: COLLECTIONS.AGENCY,
          data: {
            name: agency.name,
            status: agency.status,
            address: agency.address,
            timezone: agency.timezone,
            tenant: tenantId,
          },
        })

        // Store the ID mapping for relationships
        idMap.agencies[agency.id] = newAgency.id
        console.log(`Migrated agency: ${agency.name} (${agency.id} -> ${newAgency.id})`)
      } catch (error) {
        console.error(`Error migrating agency ${agency.id}:`, error.message)
      }
    })
  } catch (error) {
    console.error('Error querying agencies:', error.message)
  }
}

async function migrateAgents(payload) {
  console.log('Migrating agents...')

  try {
    // Query MCP database for agents
    const { rows } = await pool.query('SELECT * FROM "Agent"')
    console.log(`Found ${rows.length} agents to migrate`)

    // Migrate each agent
    for (const agent of rows) {
      try {
        const newAgent = await payload.create({
          collection: COLLECTIONS.AGENT,
          data: {
            name: agent.name,
            status: agent.status || AgentStatus.ACTIVE,
          },
        })

        // Store the ID mapping for relationships
        idMap.agents[agent.id] = newAgent.id
        console.log(`Migrated agent: ${agent.name} (${agent.id} -> ${newAgent.id})`)
      } catch (error) {
        console.error(`Error migrating agent ${agent.id}:`, error.message)
      }
    }
  } catch (error) {
    console.error('Error querying agents:', error.message)
  }
}

async function migrateConsumers(payload) {
  console.log('Migrating consumers...')

  try {
    // Query MCP database for consumers
    const { rows } = await pool.query('SELECT * FROM "Consumer"')
    console.log(`Found ${rows.length} consumers to migrate`)

    // Migrate each consumer
    for (const consumer of rows) {
      try {
        const newConsumer = await payload.create({
          collection: COLLECTIONS.CONSUMER,
          data: {
            firstName: consumer.firstName,
            lastName: consumer.lastName,
            email: consumer.email,
            phoneNumber: consumer.phoneNumber,
            dateOfBirth: consumer.dateOfBirth,
            status: consumer.status || ConsumerStatus.ACTIVE,
          },
        })

        // Store the ID mapping for relationships
        idMap.consumers[consumer.id] = newConsumer.id
        console.log(
          `Migrated consumer: ${consumer.firstName} ${consumer.lastName} (${consumer.id} -> ${newConsumer.id})`,
        )
      } catch (error) {
        console.error(`Error migrating consumer ${consumer.id}:`, error.message)
      }
    }
  } catch (error) {
    console.error('Error querying consumers:', error.message)
  }
}

async function migrateSessionTypes(payload) {
  console.log('Migrating session types...')

  try {
    // Query MCP database for session types
    const { rows } = await pool.query('SELECT * FROM "SessionType"')
    console.log(`Found ${rows.length} session types to migrate`)

    // Migrate each session type
    for (const sessionType of rows) {
      try {
        const newSessionType = await payload.create({
          collection: COLLECTIONS.SESSION_TYPE,
          data: {
            name: sessionType.name,
            minAgents: sessionType.minAgents,
            maxAgents: sessionType.maxAgents,
            minConsumers: sessionType.minConsumers,
            maxConsumers: sessionType.maxConsumers,
            defaultDuration: sessionType.defaultDuration,
            description: sessionType.description,
          },
        })

        // Store the ID mapping for relationships
        idMap['session-types'][sessionType.id] = newSessionType.id
        console.log(
          `Migrated session type: ${sessionType.name} (${sessionType.id} -> ${newSessionType.id})`,
        )
      } catch (error) {
        console.error(`Error migrating session type ${sessionType.id}:`, error.message)
      }
    }
  } catch (error) {
    console.error('Error querying session types:', error.message)
  }
}

async function migrateContexts(payload) {
  console.log('Migrating contexts...')

  try {
    // Query MCP database for contexts
    const { rows } = await pool.query('SELECT * FROM "Context"')
    console.log(`Found ${rows.length} contexts to migrate`)

    // Migrate each context
    for (const context of rows) {
      try {
        // Map the agency ID to the new ID in Payload
        const agencyId = idMap.agencies[context.agencyId]

        if (!agencyId) {
          console.warn(
            `Agency ID ${context.agencyId} not found for context ${context.id}, skipping`,
          )
          continue
        }

        const newContext = await payload.create({
          collection: COLLECTIONS.CONTEXT,
          data: {
            name: context.name,
            agency: agencyId,
            defaultBufferTime: context.defaultBufferTime,
            defaultMaxCapacity: context.defaultMaxCapacity,
            description: context.description,
          },
        })

        // Store the ID mapping for relationships
        idMap.contexts[context.id] = newContext.id
        console.log(`Migrated context: ${context.name} (${context.id} -> ${newContext.id})`)
      } catch (error) {
        console.error(`Error migrating context ${context.id}:`, error.message)
      }
    }
  } catch (error) {
    console.error('Error querying contexts:', error.message)
  }
}

async function migrateTimeSlots(payload) {
  console.log('Migrating time slots...')

  try {
    // Query MCP database for time slots
    const { rows } = await pool.query('SELECT * FROM "TimeSlot"')
    console.log(`Found ${rows.length} time slots to migrate`)

    // Migrate each time slot
    for (const timeSlot of rows) {
      try {
        // Map the related IDs to the new IDs in Payload
        const agentId = idMap.agents[timeSlot.agentId]
        const contextId = idMap.contexts[timeSlot.contextId]
        const sessionTypeId = idMap['session-types'][timeSlot.sessionTypeId]

        if (!agentId || !contextId || !sessionTypeId) {
          console.warn(`Missing related IDs for time slot ${timeSlot.id}, skipping`)
          continue
        }

        const newTimeSlot = await payload.create({
          collection: COLLECTIONS.TIME_SLOT,
          data: {
            cron: timeSlot.cron,
            startYear: timeSlot.startYear,
            endYear: timeSlot.endYear,
            isRecurring: timeSlot.isRecurring,
            agent: agentId,
            context: contextId,
            sessionType: sessionTypeId,
            duration: timeSlot.duration,
            description: timeSlot.description,
          },
        })

        // Store the ID mapping for relationships
        idMap['time-slots'][timeSlot.id] = newTimeSlot.id
        console.log(`Migrated time slot: ${timeSlot.id} -> ${newTimeSlot.id}`)
      } catch (error) {
        console.error(`Error migrating time slot ${timeSlot.id}:`, error.message)
      }
    }
  } catch (error) {
    console.error('Error querying time slots:', error.message)
  }
}

async function migrateAllocations(payload) {
  console.log('Migrating allocations...')

  try {
    // Query MCP database for allocations
    const { rows } = await pool.query('SELECT * FROM "Allocation"')
    console.log(`Found ${rows.length} allocations to migrate`)

    // Migrate each allocation
    for (const allocation of rows) {
      try {
        // Map the time slot ID to the new ID in Payload
        const timeSlotId = idMap['time-slots'][allocation.timeSlotId]

        if (!timeSlotId) {
          console.warn(
            `Time slot ID ${allocation.timeSlotId} not found for allocation ${allocation.id}, skipping`,
          )
          continue
        }

        const newAllocation = await payload.create({
          collection: COLLECTIONS.ALLOCATION,
          data: {
            startTime: allocation.startTime,
            endTime: allocation.endTime,
            status: allocation.status || AllocationStatus.AVAILABLE,
            timeSlot: timeSlotId,
            currentReservations: allocation.currentReservations || 0,
            version: allocation.version || 1,
            note: allocation.note,
          },
        })

        // Store the ID mapping for relationships
        idMap.allocations[allocation.id] = newAllocation.id
        console.log(`Migrated allocation: ${allocation.id} -> ${newAllocation.id}`)
      } catch (error) {
        console.error(`Error migrating allocation ${allocation.id}:`, error.message)
      }
    }
  } catch (error) {
    console.error('Error querying allocations:', error.message)
  }
}

async function migrateBundles(payload) {
  console.log('Migrating bundles...')

  try {
    // Query MCP database for bundles
    const { rows } = await pool.query('SELECT * FROM "Bundle"')
    console.log(`Found ${rows.length} bundles to migrate`)

    // Migrate each bundle
    for (const bundle of rows) {
      try {
        // Map the consumer ID to the new ID in Payload
        const consumerId = idMap.consumers[bundle.consumerId]

        if (!consumerId) {
          console.warn(
            `Consumer ID ${bundle.consumerId} not found for bundle ${bundle.id}, skipping`,
          )
          continue
        }

        const newBundle = await payload.create({
          collection: COLLECTIONS.BUNDLE,
          data: {
            status: bundle.status || BundleStatus.ACTIVE,
            validFrom: bundle.validFrom,
            validTo: bundle.validTo,
            consumer: consumerId,
            note: bundle.note,
          },
        })

        // Store the ID mapping for relationships
        idMap.bundles[bundle.id] = newBundle.id
        console.log(`Migrated bundle: ${bundle.id} -> ${newBundle.id}`)
      } catch (error) {
        console.error(`Error migrating bundle ${bundle.id}:`, error.message)
      }
    }
  } catch (error) {
    console.error('Error querying bundles:', error.message)
  }
}

async function migrateReservations(payload) {
  console.log('Migrating reservations...')

  try {
    // Query MCP database for reservations
    const { rows } = await pool.query('SELECT * FROM "Reservation"')
    console.log(`Found ${rows.length} reservations to migrate`)

    // Migrate each reservation
    for (const reservation of rows) {
      try {
        // Map the related IDs to the new IDs in Payload
        const consumerId = idMap.consumers[reservation.consumerId]
        const sessionTypeId = idMap['session-types'][reservation.sessionTypeId]
        const timeSlotId = idMap['time-slots'][reservation.timeSlotId]
        const bundleId = idMap.bundles[reservation.bundleId]

        if (!consumerId || !sessionTypeId || !timeSlotId) {
          console.warn(`Missing required related IDs for reservation ${reservation.id}, skipping`)
          continue
        }

        const newReservation = await payload.create({
          collection: COLLECTIONS.RESERVATION,
          data: {
            consumer: consumerId,
            sessionType: sessionTypeId,
            timeSlot: timeSlotId,
            status: reservation.status || ReservationStatus.CONFIRMED,
            bundle: bundleId, // This can be null/undefined
            note: reservation.note,
          },
        })

        // Store the ID mapping for relationships
        idMap.reservations[reservation.id] = newReservation.id
        console.log(`Migrated reservation: ${reservation.id} -> ${newReservation.id}`)
      } catch (error) {
        console.error(`Error migrating reservation ${reservation.id}:`, error.message)
      }
    }
  } catch (error) {
    console.error('Error querying reservations:', error.message)
  }
}

async function migrateGroupReservations(payload) {
  console.log('Migrating group reservations...')

  try {
    // Query MCP database for group reservations
    const { rows } = await pool.query('SELECT * FROM "GroupReservation"')
    console.log(`Found ${rows.length} group reservations to migrate`)

    // Migrate each group reservation
    for (const groupReservation of rows) {
      try {
        // Map the related IDs to the new IDs in Payload
        const sessionTypeId = idMap['session-types'][groupReservation.sessionTypeId]
        const timeSlotId = idMap['time-slots'][groupReservation.timeSlotId]

        if (!sessionTypeId || !timeSlotId) {
          console.warn(
            `Missing required related IDs for group reservation ${groupReservation.id}, skipping`,
          )
          continue
        }

        const newGroupReservation = await payload.create({
          collection: COLLECTIONS.GROUP_RESERVATION,
          data: {
            name: groupReservation.name,
            sessionType: sessionTypeId,
            timeSlot: timeSlotId,
            status: groupReservation.status || GroupReservationStatus.CONFIRMED,
            maxParticipants: groupReservation.maxParticipants,
            note: groupReservation.note,
          },
        })

        // Store the ID mapping for relationships
        idMap['group-reservations'][groupReservation.id] = newGroupReservation.id
        console.log(
          `Migrated group reservation: ${groupReservation.name} (${groupReservation.id} -> ${newGroupReservation.id})`,
        )
      } catch (error) {
        console.error(`Error migrating group reservation ${groupReservation.id}:`, error.message)
      }
    }
  } catch (error) {
    console.error('Error querying group reservations:', error.message)
  }
}

async function migrateSessions(payload) {
  console.log('Migrating sessions...')

  try {
    // Query MCP database for sessions
    const { rows } = await pool.query('SELECT * FROM "Session"')
    console.log(`Found ${rows.length} sessions to migrate`)

    // Migrate each session
    for (const session of rows) {
      try {
        // Map the related IDs to the new IDs in Payload
        const sessionTypeId = idMap['session-types'][session.sessionTypeId]
        const timeSlotId = idMap['time-slots'][session.timeSlotId]

        if (!sessionTypeId || !timeSlotId) {
          console.warn(`Missing required related IDs for session ${session.id}, skipping`)
          continue
        }

        // Handle agent IDs - these might be an array
        let agentIds = []
        if (session.agentIds && Array.isArray(session.agentIds)) {
          agentIds = session.agentIds.map((id) => idMap.agents[id]).filter((id) => id) // Filter out undefined/null values
        }

        // Handle reservation IDs - these might be an array
        let reservationIds = []
        if (session.reservationIds && Array.isArray(session.reservationIds)) {
          reservationIds = session.reservationIds
            .map((id) => idMap.reservations[id])
            .filter((id) => id) // Filter out undefined/null values
        }

        // Map group reservation ID if it exists
        const groupReservationId = session.groupReservationId
          ? idMap['group-reservations'][session.groupReservationId]
          : undefined

        const newSession = await payload.create({
          collection: COLLECTIONS.SESSION,
          data: {
            sessionType: sessionTypeId,
            timeSlot: timeSlotId,
            status: session.status || SessionStatus.SCHEDULED,
            reservations: reservationIds,
            groupReservation: groupReservationId,
            agents: agentIds,
            startedAt: session.startedAt,
            endedAt: session.endedAt,
            note: session.note,
          },
        })

        // Store the ID mapping for relationships
        idMap.sessions[session.id] = newSession.id
        console.log(`Migrated session: ${session.id} -> ${newSession.id}`)
      } catch (error) {
        console.error(`Error migrating session ${session.id}:`, error.message)
      }
    }
  } catch (error) {
    console.error('Error querying sessions:', error.message)
  }
}

async function migrateSessionConsumers(payload) {
  console.log('Migrating session consumers...')

  try {
    // Query MCP database for session consumers
    const { rows } = await pool.query('SELECT * FROM "SessionConsumer"')
    console.log(`Found ${rows.length} session consumers to migrate`)

    // Migrate each session consumer
    for (const sessionConsumer of rows) {
      try {
        // Map the related IDs to the new IDs in Payload
        const sessionId = idMap.sessions[sessionConsumer.sessionId]
        const consumerId = idMap.consumers[sessionConsumer.consumerId]
        const reservationId = sessionConsumer.reservationId
          ? idMap.reservations[sessionConsumer.reservationId]
          : undefined

        if (!sessionId || !consumerId) {
          console.warn(
            `Missing required related IDs for session consumer ${sessionConsumer.id}, skipping`,
          )
          continue
        }

        const newSessionConsumer = await payload.create({
          collection: COLLECTIONS.SESSION_CONSUMER,
          data: {
            session: sessionId,
            consumer: consumerId,
            reservation: reservationId,
            status: sessionConsumer.status || SessionConsumerStatus.ATTENDED,
            checkedInAt: sessionConsumer.checkedInAt,
            checkedOutAt: sessionConsumer.checkedOutAt,
            note: sessionConsumer.note,
          },
        })

        console.log(`Migrated session consumer: ${sessionConsumer.id} -> ${newSessionConsumer.id}`)
      } catch (error) {
        console.error(`Error migrating session consumer ${sessionConsumer.id}:`, error.message)
      }
    }
  } catch (error) {
    console.error('Error querying session consumers:', error.message)
  }
}

async function migrateAltSessionAgents(payload) {
  console.log('Migrating alt session agents...')

  try {
    // Query MCP database for alt session agents
    const { rows } = await pool.query('SELECT * FROM "AltSessionAgent"')
    console.log(`Found ${rows.length} alt session agents to migrate`)

    // Migrate each alt session agent
    for (const altSessionAgent of rows) {
      try {
        // Map the session ID to the new ID in Payload
        const sessionId = idMap.sessions[altSessionAgent.sessionId]

        if (!sessionId) {
          console.warn(
            `Session ID ${altSessionAgent.sessionId} not found for alt session agent ${altSessionAgent.id}, skipping`,
          )
          continue
        }

        const newAltSessionAgent = await payload.create({
          collection: COLLECTIONS.ALT_SESSION_AGENT,
          data: {
            name: altSessionAgent.name,
            email: altSessionAgent.email,
            session: sessionId,
            role: altSessionAgent.role,
            note: altSessionAgent.note,
          },
        })

        console.log(
          `Migrated alt session agent: ${altSessionAgent.name} (${altSessionAgent.id} -> ${newAltSessionAgent.id})`,
        )
      } catch (error) {
        console.error(`Error migrating alt session agent ${altSessionAgent.id}:`, error.message)
      }
    }
  } catch (error) {
    console.error('Error querying alt session agents:', error.message)
  }
}

async function migrateTags(payload) {
  console.log('Migrating tags...')

  try {
    // Query MCP database for tags
    const { rows } = await pool.query('SELECT * FROM "Tag"')
    console.log(`Found ${rows.length} tags to migrate`)

    // Migrate each tag
    for (const tag of rows) {
      try {
        const newTag = await payload.create({
          collection: COLLECTIONS.TAG,
          data: {
            name: tag.name,
            category: tag.category,
            description: tag.description,
          },
        })

        console.log(`Migrated tag: ${tag.name} (${tag.id} -> ${newTag.id})`)
      } catch (error) {
        console.error(`Error migrating tag ${tag.id}:`, error.message)
      }
    }
  } catch (error) {
    console.error('Error querying tags:', error.message)
  }
}

async function migrateAddresses(payload) {
  console.log('Migrating addresses...')

  try {
    // Query MCP database for addresses
    const { rows } = await pool.query('SELECT * FROM "Address"')
    console.log(`Found ${rows.length} addresses to migrate`)

    // Migrate each address
    for (const address of rows) {
      try {
        const newAddress = await payload.create({
          collection: COLLECTIONS.ADDRESS,
          data: {
            line1: address.line1,
            line2: address.line2,
            city: address.city,
            state: address.state,
            postalCode: address.postalCode,
            country: address.country,
            isVerified: address.isVerified || false,
          },
        })

        console.log(`Migrated address: ${address.id} -> ${newAddress.id}`)
      } catch (error) {
        console.error(`Error migrating address ${address.id}:`, error.message)
      }
    }
  } catch (error) {
    console.error('Error querying addresses:', error.message)
  }
}

async function migrateAgentSessionTypeAgencies(payload) {
  console.log('Migrating agent session type agencies...')

  try {
    // Query MCP database for agent session type agencies
    const { rows } = await pool.query('SELECT * FROM "AgentSessionTypeAgency"')
    console.log(`Found ${rows.length} agent session type agencies to migrate`)

    // Migrate each agent session type agency
    for (const agentSessionTypeAgency of rows) {
      try {
        // Map the related IDs to the new IDs in Payload
        const agentId = idMap.agents[agentSessionTypeAgency.agentId]
        const sessionTypeId = idMap['session-types'][agentSessionTypeAgency.sessionTypeId]
        const agencyId = idMap.agencies[agentSessionTypeAgency.agencyId]

        if (!agentId || !sessionTypeId || !agencyId) {
          console.warn(
            `Missing required related IDs for agent session type agency ${agentSessionTypeAgency.id}, skipping`,
          )
          continue
        }

        const newAgentSessionTypeAgency = await payload.create({
          collection: COLLECTIONS.AGENT_SESSION_TYPE_AGENCY,
          data: {
            agent: agentId,
            sessionType: sessionTypeId,
            agency: agencyId,
            isActive: agentSessionTypeAgency.isActive,
            startDate: agentSessionTypeAgency.startDate,
            endDate: agentSessionTypeAgency.endDate,
            note: agentSessionTypeAgency.note,
          },
        })

        console.log(
          `Migrated agent session type agency: ${agentSessionTypeAgency.id} -> ${newAgentSessionTypeAgency.id}`,
        )
      } catch (error) {
        console.error(
          `Error migrating agent session type agency ${agentSessionTypeAgency.id}:`,
          error.message,
        )
      }
    }
  } catch (error) {
    console.error('Error querying agent session type agencies:', error.message)
  }
}

// Run the migration
main()
