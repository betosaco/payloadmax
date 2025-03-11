/**
 * Check Collections Script
 *
 * This script checks if the required collections exist in Payload CMS.
 *
 * Usage:
 * - Run with: npm run check:collections
 */

import dotenv from 'dotenv'
import path from 'path'
import { fileURLToPath } from 'url'
import payload from 'payload'

// Set up environment
const __dirname = path.dirname(fileURLToPath(import.meta.url))
dotenv.config({
  path: path.resolve(__dirname, '../../.env'),
})

// Set the PAYLOAD_CONFIG_PATH environment variable
const configPath = path.resolve(__dirname, '../payload.config.ts')
console.log('Config path:', configPath)
process.env.PAYLOAD_CONFIG_PATH = configPath

/**
 * Main function to check collections
 */
async function main() {
  try {
    console.log('Initializing Payload...')

    // Initialize Payload
    await payload.init({
      secret: process.env.PAYLOAD_SECRET || 'matpass_migration_secret_key',
      local: true,
      onInit: () => {
        console.log('Payload initialized successfully')
      },
      email: {
        transportOptions: {
          host: process.env.SMTP_HOST || 'smtp.example.com',
          auth: {
            user: process.env.SMTP_USER || 'user',
            pass: process.env.SMTP_PASS || 'pass',
          },
        },
        fromName: process.env.SMTP_FROM_NAME || 'Admin',
        fromAddress: process.env.SMTP_FROM_ADDRESS || 'admin@example.com',
      },
    })

    // Get all collections
    console.log('Available collections:')
    const collections = Object.keys(payload.collections)

    if (collections.length === 0) {
      console.log('No collections found.')
    } else {
      collections.forEach((collection) => {
        console.log(`- ${collection}`)
      })
    }

    // Check for required collections
    const requiredCollections = ['tenants', 'agencies', 'agents']
    const missingCollections = requiredCollections.filter(
      (collection) => !collections.includes(collection),
    )

    if (missingCollections.length > 0) {
      console.log('\nMissing required collections:')
      missingCollections.forEach((collection) => {
        console.log(`- ${collection}`)
      })

      console.log('\nYou need to create these collections before running the migration.')
    } else {
      console.log('\nAll required collections exist.')
    }

    process.exit(0)
  } catch (error) {
    console.error('Error checking collections:', error)
    process.exit(1)
  }
}

main()
