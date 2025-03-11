/**
 * Database connection check script
 *
 * This script verifies the connection to both the MCP PostgreSQL database
 * and the Payload CMS instance before running the full migration.
 *
 * Run with: node src/seed/check-connection.js
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
  console.log('Checking database connections...')

  try {
    // Check PostgreSQL connection
    console.log('Checking PostgreSQL connection...')
    const pgClient = await pool.connect()

    console.log('✅ PostgreSQL connection successful!')
    console.log('PostgreSQL version:', (await pgClient.query('SELECT version()')).rows[0].version)

    // Check available tables
    const { rows: tables } = await pgClient.query(
      "SELECT table_name FROM information_schema.tables WHERE table_schema = 'public'",
    )

    console.log(`Found ${tables.length} tables in the database:`)
    tables.forEach((table) => console.log(`- ${table.table_name}`))

    pgClient.release()

    // Check Payload connection
    console.log('\nChecking Payload CMS connection...')

    try {
      // Set the PAYLOAD_CONFIG_PATH environment variable
      const configPath = path.resolve(__dirname, '../payload.config.ts')
      console.log('Config path:', configPath)
      process.env.PAYLOAD_CONFIG_PATH = configPath

      // Import payload dynamically
      const { default: payload } = await import('payload')

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

      // Check available collections
      if (payload.collections) {
        const collections = Object.keys(payload.collections)
        console.log(`Found ${collections.length} collections in Payload CMS:`)
        collections.forEach((collection) => console.log(`- ${collection}`))
      } else {
        console.log('No collections found in Payload CMS')
      }

      console.log('\n✅ All connections verified successfully!')
      console.log('You can now run the migration script with: npm run migrate:mcp')
    } catch (payloadError) {
      console.error('❌ Error connecting to Payload CMS:', payloadError)
      console.log('\n⚠️ PostgreSQL connection is working, but Payload CMS connection failed.')
      console.log('Please check your Payload CMS configuration and try again.')
    }

    process.exit(0)
  } catch (error) {
    console.error('❌ Error checking connections:', error)
    process.exit(1)
  } finally {
    // Close the database pool
    await pool.end()
  }
}

main()
