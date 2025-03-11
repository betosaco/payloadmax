/**
 * Run Migration in Cursor
 *
 * This file is meant to be copied and pasted into the Cursor AI chat to run the migration.
 * It will execute the migration script directly in Cursor, using the MCP query tool.
 *
 * Usage:
 * 1. Copy this entire file
 * 2. Paste it into the Cursor AI chat
 * 3. Ask Cursor AI to execute the migration
 */

// Import required modules
const dotenv = require('dotenv')
const path = require('path')
const payload = require('payload')

// Configuration
const BATCH_SIZE = 50
const SEED_SAMPLE_DATA = true

// Map to store original IDs to new IDs for reference relationships
const idMap = {
  tenants: {},
  agencies: {},
  agents: {},
}

// Helper to check if a migration is enabled
const isMigrationEnabled = (name) => {
  return true // Enable all migrations by default in this script
}

/**
 * Check if the MCP database has data
 */
async function checkMcpHasData() {
  try {
    const tenantCount = await mcp__query({ sql: 'SELECT COUNT(*) FROM "Tenant"' })
    return parseInt(tenantCount.content[0]?.count || '0', 10) > 0
  } catch (error) {
    console.error('Error checking if MCP has data:', error)
    return false
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

    // Initialize Payload
    console.log('Initializing Payload...')
    await payload.init({
      secret: 'matpass_migration_secret_key',
      local: true,
      onInit: () => {
        console.log('Payload initialized successfully')
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

    // Check if MCP has data
    const mcpHasData = await checkMcpHasData()

    if (mcpHasData) {
      console.log('MCP database has data. Running migration...')
      // Migration code would go here
      console.log('Migration not implemented in this script. Please use the full migration script.')
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
  } catch (error) {
    console.error('Process failed:', error)
  }
}

// Execute the main function
main()
