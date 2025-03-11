/**
 * MCP Cursor Migration Script
 *
 * This script migrates data from the MCP database in Cursor to Payload CMS collections.
 * It uses the MCP query tool to fetch data directly from Cursor.
 *
 * If the MCP database is empty, it can also seed sample data into Payload CMS.
 *
 * Usage:
 * - Run with: npm run migrate:mcp-cursor
 * - Control which migrations run with environment variables:
 *   MIGRATE_TENANTS=true MIGRATE_AGENCIES=true npm run migrate:mcp-cursor
 * - Control batch size with: BATCH_SIZE=100 npm run migrate:mcp-cursor
 * - Seed sample data if MCP is empty: SEED_SAMPLE_DATA=true npm run migrate:mcp-cursor
 */

import dotenv from 'dotenv'
import path from 'path'
import { fileURLToPath } from 'url'
import payload from 'payload'
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

// Import the mcp__query function from Cursor
// This is a special function provided by Cursor that allows querying the MCP database
import { mcp__query } from 'cursor'

// Set up environment
const __dirname = path.dirname(fileURLToPath(import.meta.url))
dotenv.config({
  path: path.resolve(__dirname, '../../.env'),
})

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

// Configuration
const BATCH_SIZE = parseInt(process.env.BATCH_SIZE || '50', 10)
const SEED_SAMPLE_DATA = process.env.SEED_SAMPLE_DATA === 'true'

// Helper to check if a migration is enabled
const isMigrationEnabled = (name) => {
  const envVar = `MIGRATE_${name.toUpperCase()}`
  return process.env[envVar] !== 'false' // Enable by default unless explicitly disabled
}

/**
 * Execute an MCP query using the Cursor-provided tool
 * @param {string} sql - SQL query to execute
 * @returns {Promise<Array>} - Query results
 */
async function executeMcpQuery(sql) {
  try {
    console.log(`Executing MCP query: ${sql}`)
    const result = await mcp__query({ sql })

    if (!result || !result.content) {
      console.warn('Query returned no content')
      return []
    }

    return result.content
  } catch (error) {
    console.error('Error executing MCP query:', error)
    throw error
  }
}

/**
 * Check if the MCP database has data
 * @returns {Promise<boolean>} - True if the database has data, false otherwise
 */
async function checkMcpHasData() {
  try {
    const tenantCount = await executeMcpQuery('SELECT COUNT(*) FROM "Tenant"')
    return parseInt(tenantCount[0]?.count || '0', 10) > 0
  } catch (error) {
    console.error('Error checking if MCP has data:', error)
    return false
  }
}

/**
 * Migrate tenants from MCP to Payload
 */
async function migrateTenants() {
  if (!isMigrationEnabled('tenants')) {
    console.log('Skipping tenants migration (disabled by env var)')
    return
  }

  console.log('Starting tenants migration...')

  try {
    // Get total count for progress tracking
    const countResult = await executeMcpQuery('SELECT COUNT(*) FROM "Tenant"')
    const totalCount = parseInt(countResult[0]?.count || '0', 10)
    console.log(`Found ${totalCount} tenants to migrate`)

    // Process in batches
    let offset = 0
    let processed = 0

    while (offset < totalCount) {
      const query = `
        SELECT * FROM "Tenant"
        ORDER BY id
        LIMIT ${BATCH_SIZE} OFFSET ${offset}
      `

      const tenants = await executeMcpQuery(query)
      console.log(`Processing tenants batch: ${offset} to ${offset + tenants.length}`)

      // Process each tenant
      for (const tenant of tenants) {
        try {
          const newTenant = await payload.create({
            collection: 'tenants',
            data: {
              name: tenant.name || 'Unnamed Tenant',
              email: tenant.email,
              phone: tenant.phone,
              // Map other fields as needed
              mcpId: tenant.id.toString(), // Store original ID for reference
            },
          })

          // Store ID mapping for relationships
          idMap.tenants[tenant.id] = newTenant.id
          processed++

          if (processed % 10 === 0) {
            console.log(`Processed ${processed}/${totalCount} tenants`)
          }
        } catch (error) {
          console.error(`Error creating tenant ${tenant.id}:`, error.message)
        }
      }

      offset += BATCH_SIZE
    }

    console.log(`Completed tenants migration. Processed ${processed} tenants.`)
  } catch (error) {
    console.error('Error in tenants migration:', error)
  }
}

/**
 * Migrate agencies from MCP to Payload
 */
async function migrateAgencies() {
  if (!isMigrationEnabled('agencies')) {
    console.log('Skipping agencies migration (disabled by env var)')
    return
  }

  console.log('Starting agencies migration...')

  try {
    // Get total count for progress tracking
    const countResult = await executeMcpQuery('SELECT COUNT(*) FROM "Agency"')
    const totalCount = parseInt(countResult[0]?.count || '0', 10)
    console.log(`Found ${totalCount} agencies to migrate`)

    // Process in batches
    let offset = 0
    let processed = 0

    while (offset < totalCount) {
      const query = `
        SELECT * FROM "Agency"
        ORDER BY id
        LIMIT ${BATCH_SIZE} OFFSET ${offset}
      `

      const agencies = await executeMcpQuery(query)
      console.log(`Processing agencies batch: ${offset} to ${offset + agencies.length}`)

      // Process each agency
      for (const agency of agencies) {
        try {
          const newAgency = await payload.create({
            collection: 'agencies',
            data: {
              name: agency.name || 'Unnamed Agency',
              email: agency.email,
              phone: agency.phone,
              address: agency.address,
              // Map other fields as needed
              mcpId: agency.id.toString(), // Store original ID for reference
            },
          })

          // Store ID mapping for relationships
          idMap.agencies[agency.id] = newAgency.id
          processed++

          if (processed % 10 === 0) {
            console.log(`Processed ${processed}/${totalCount} agencies`)
          }
        } catch (error) {
          console.error(`Error creating agency ${agency.id}:`, error.message)
        }
      }

      offset += BATCH_SIZE
    }

    console.log(`Completed agencies migration. Processed ${processed} agencies.`)
  } catch (error) {
    console.error('Error in agencies migration:', error)
  }
}

/**
 * Migrate agents from MCP to Payload
 */
async function migrateAgents() {
  if (!isMigrationEnabled('agents')) {
    console.log('Skipping agents migration (disabled by env var)')
    return
  }

  console.log('Starting agents migration...')

  try {
    // Get total count for progress tracking
    const countResult = await executeMcpQuery('SELECT COUNT(*) FROM "Agent"')
    const totalCount = parseInt(countResult[0]?.count || '0', 10)
    console.log(`Found ${totalCount} agents to migrate`)

    // Process in batches
    let offset = 0
    let processed = 0

    while (offset < totalCount) {
      const query = `
        SELECT a.*, ag.id as agency_id 
        FROM "Agent" a
        LEFT JOIN "Agency" ag ON a.agency_id = ag.id
        ORDER BY a.id
        LIMIT ${BATCH_SIZE} OFFSET ${offset}
      `

      const agents = await executeMcpQuery(query)
      console.log(`Processing agents batch: ${offset} to ${offset + agents.length}`)

      // Process each agent
      for (const agent of agents) {
        try {
          // Look up the new agency ID if available
          let agencyId = null
          if (agent.agency_id && idMap.agencies[agent.agency_id]) {
            agencyId = idMap.agencies[agent.agency_id]
          }

          const newAgent = await payload.create({
            collection: 'agents',
            data: {
              name: agent.name || 'Unnamed Agent',
              email: agent.email,
              phone: agent.phone,
              agency: agencyId, // Reference to the new agency
              // Map other fields as needed
              mcpId: agent.id.toString(), // Store original ID for reference
            },
          })

          // Store ID mapping for relationships
          idMap.agents[agent.id] = newAgent.id
          processed++

          if (processed % 10 === 0) {
            console.log(`Processed ${processed}/${totalCount} agents`)
          }
        } catch (error) {
          console.error(`Error creating agent ${agent.id}:`, error.message)
        }
      }

      offset += BATCH_SIZE
    }

    console.log(`Completed agents migration. Processed ${processed} agents.`)
  } catch (error) {
    console.error('Error in agents migration:', error)
  }
}

/**
 * Seed sample data into Payload CMS
 */
async function seedSampleData() {
  console.log('Seeding sample data into Payload CMS...')

  try {
    // Seed tenants
    console.log('Seeding tenants...')
    const sampleTenants = [
      {
        name: 'Sample Tenant 1',
        email: 'tenant1@example.com',
        phone: '123-456-7890',
      },
      {
        name: 'Sample Tenant 2',
        email: 'tenant2@example.com',
        phone: '123-456-7891',
      },
    ]

    for (const tenant of sampleTenants) {
      try {
        const newTenant = await payload.create({
          collection: 'tenants',
          data: tenant,
        })
        console.log(`Created tenant: ${tenant.name} (${newTenant.id})`)

        // Store ID for relationships
        idMap.tenants[newTenant.id] = newTenant.id
      } catch (error) {
        console.error(`Error creating tenant ${tenant.name}:`, error.message)
      }
    }

    // Seed agencies
    console.log('Seeding agencies...')
    const sampleAgencies = [
      {
        name: 'Sample Agency 1',
        email: 'agency1@example.com',
        phone: '123-456-7892',
        address: '123 Main St, City, State 12345',
      },
      {
        name: 'Sample Agency 2',
        email: 'agency2@example.com',
        phone: '123-456-7893',
        address: '456 Oak St, City, State 12345',
      },
    ]

    for (const agency of sampleAgencies) {
      try {
        const newAgency = await payload.create({
          collection: 'agencies',
          data: agency,
        })
        console.log(`Created agency: ${agency.name} (${newAgency.id})`)

        // Store ID for relationships
        idMap.agencies[newAgency.id] = newAgency.id
      } catch (error) {
        console.error(`Error creating agency ${agency.name}:`, error.message)
      }
    }

    // Seed agents
    console.log('Seeding agents...')
    const sampleAgents = [
      {
        name: 'Sample Agent 1',
        email: 'agent1@example.com',
        phone: '123-456-7894',
        agency: Object.values(idMap.agencies)[0], // Reference to the first agency
      },
      {
        name: 'Sample Agent 2',
        email: 'agent2@example.com',
        phone: '123-456-7895',
        agency: Object.values(idMap.agencies)[1], // Reference to the second agency
      },
    ]

    for (const agent of sampleAgents) {
      try {
        const newAgent = await payload.create({
          collection: 'agents',
          data: agent,
        })
        console.log(`Created agent: ${agent.name} (${newAgent.id})`)

        // Store ID for relationships
        idMap.agents[newAgent.id] = newAgent.id
      } catch (error) {
        console.error(`Error creating agent ${agent.name}:`, error.message)
      }
    }

    console.log('Sample data seeding completed.')
  } catch (error) {
    console.error('Error seeding sample data:', error)
  }
}

/**
 * Main function to run the migration
 */
async function main() {
  try {
    console.log('Starting MCP to Payload migration...')
    console.log(`Batch size: ${BATCH_SIZE}`)

    // Initialize Payload
    console.log('Initializing Payload...')
    await payload.init({
      secret: process.env.PAYLOAD_SECRET || 'matpass_migration_secret_key',
      local: true,
      onInit: () => {
        console.log('Payload initialized successfully')
      },
      email: {
        transportOptions: {
          host: process.env.SMTP_HOST,
          auth: {
            user: process.env.SMTP_USER,
            pass: process.env.SMTP_PASS,
          },
        },
        fromName: process.env.SMTP_FROM_NAME,
        fromAddress: process.env.SMTP_FROM_ADDRESS,
      },
    })

    // Check if MCP has data
    const mcpHasData = await checkMcpHasData()

    if (mcpHasData) {
      console.log('MCP database has data. Running migration...')

      // Run migrations in sequence
      await migrateTenants()
      await migrateAgencies()
      await migrateAgents()
      // Add more migrations as needed
    } else {
      console.log('MCP database is empty.')

      if (SEED_SAMPLE_DATA) {
        console.log('Seeding sample data instead...')
        await seedSampleData()
      } else {
        console.log('Skipping migration. Set SEED_SAMPLE_DATA=true to seed sample data.')
      }
    }

    console.log('Process completed successfully')
    process.exit(0)
  } catch (error) {
    console.error('Process failed:', error)
    process.exit(1)
  }
}

main()
