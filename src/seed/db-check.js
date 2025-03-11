/**
 * PostgreSQL database connection check script
 *
 * This script verifies the connection to the MCP PostgreSQL database
 * and lists the available tables.
 *
 * Run with: node src/seed/db-check.js
 */

import dotenv from 'dotenv'
import path from 'path'
import { fileURLToPath } from 'url'
import pkg from 'pg'
const { Pool } = pkg

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

async function main() {
  console.log('Checking PostgreSQL database connection...')

  try {
    // Check PostgreSQL connection
    console.log('Connecting to PostgreSQL...')
    const pgClient = await pool.connect()

    console.log('✅ PostgreSQL connection successful!')
    console.log('PostgreSQL version:', (await pgClient.query('SELECT version()')).rows[0].version)

    // Check available tables
    const { rows: tables } = await pgClient.query(
      "SELECT table_name FROM information_schema.tables WHERE table_schema = 'public'",
    )

    console.log(`\nFound ${tables.length} tables in the database:`)
    if (tables.length > 0) {
      tables.forEach((table) => console.log(`- ${table.table_name}`))
    } else {
      console.log('No tables found in the database. Make sure you have the correct database name.')
    }

    // Check if we have the expected tables for migration
    const expectedTables = [
      'Tenant',
      'Agency',
      'Agent',
      'Consumer',
      'SessionType',
      'Context',
      'TimeSlot',
      'Allocation',
      'Bundle',
      'Reservation',
      'GroupReservation',
      'Session',
      'SessionConsumer',
      'AltSessionAgent',
      'Tag',
      'Address',
      'AgentSessionTypeAgency',
    ]

    console.log('\nChecking for expected tables:')
    const tableNames = tables.map((t) => t.table_name)
    const missingTables = expectedTables.filter((t) => !tableNames.includes(t))

    if (missingTables.length > 0) {
      console.log('⚠️ Missing tables:')
      missingTables.forEach((table) => console.log(`- ${table}`))
      console.log('\nMake sure you are connecting to the correct database.')
    } else if (tables.length > 0) {
      console.log('✅ All expected tables are present!')
    }

    // Sample data from a table if available
    if (tableNames.includes('Tenant')) {
      console.log('\nSample data from Tenant table:')
      const { rows: tenants } = await pgClient.query('SELECT * FROM "Tenant" LIMIT 3')
      console.log(JSON.stringify(tenants, null, 2))
    }

    pgClient.release()
    console.log('\n✅ Database check completed successfully!')

    process.exit(0)
  } catch (error) {
    console.error('❌ Error checking database connection:', error)
    process.exit(1)
  } finally {
    // Close the database pool
    await pool.end()
  }
}

main()
