/**
 * Custom seed script for MatPass collections
 *
 * Run with: node src/seed/custom-seed.js
 */

import dotenv from 'dotenv'
import path from 'path'
import { fileURLToPath } from 'url'
import { AgencyStatus } from './enums.js'
import { COLLECTIONS } from './collections.js'

dotenv.config()

const __dirname = path.dirname(fileURLToPath(import.meta.url))

async function main() {
  console.log('Starting custom seed script...')

  try {
    // Import payload dynamically to avoid initialization issues
    const { default: payload } = await import('payload')

    // Set the PAYLOAD_CONFIG_PATH environment variable
    const configPath = path.resolve(__dirname, '../payload.config.ts')
    console.log('Config path:', configPath)
    process.env.PAYLOAD_CONFIG_PATH = configPath

    console.log('Initializing Payload...')

    // Initialize Payload
    await payload.init({
      local: true,
      secret: process.env.PAYLOAD_SECRET || 'your-secret-key',
      email: {
        fromName: 'Admin',
        fromAddress: 'admin@example.com',
        logMockCredentials: true,
      },
    })

    console.log('Payload initialized successfully!')

    // Log available collections
    console.log('Available collections:')
    if (payload.collections) {
      console.log(Object.keys(payload.collections).join(', '))
    } else {
      console.log('No collections available')
    }

    // Try to create a tenant
    console.log('Creating tenant...')
    try {
      const tenant = await payload.create({
        collection: COLLECTIONS.TENANT,
        data: {
          name: 'MatPass Demo Tenant',
          url: 'https://matpass.demo',
        },
      })

      console.log('Tenant created successfully:', tenant.id)

      // Try to create an agency
      console.log('Creating agency...')
      const agency = await payload.create({
        collection: COLLECTIONS.AGENCY,
        data: {
          name: 'MatPass Demo Agency',
          status: AgencyStatus.ACTIVE,
          address: '123 Main St, San Francisco, CA 94105',
          timezone: 'America/Los_Angeles',
          tenant: tenant.id,
        },
      })

      console.log('Agency created successfully:', agency.id)
    } catch (error) {
      console.error('Error creating documents:', error.message)
    }

    console.log('Custom seed script completed successfully!')
    process.exit(0)
  } catch (error) {
    console.error('Error running custom seed script:', error)
    process.exit(1)
  }
}

main()
