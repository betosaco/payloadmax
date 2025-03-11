/**
 * Direct seed script for MatPass collections
 *
 * Run with: node src/seed/direct-seed.js
 */

import dotenv from 'dotenv'
import path from 'path'
import { fileURLToPath } from 'url'
import payload from 'payload'
import { seed } from './index.js'

dotenv.config()

const __dirname = path.dirname(fileURLToPath(import.meta.url))

async function main() {
  console.log('Starting seed script...')

  try {
    // Set the PAYLOAD_CONFIG_PATH environment variable
    const configPath = path.resolve(__dirname, '../payload.config.ts')
    console.log('Config path:', configPath)
    process.env.PAYLOAD_CONFIG_PATH = configPath

    console.log('Initializing Payload...')
    // Initialize Payload
    await payload.init({
      local: true,
    })

    console.log('Running seed function...')
    // Run the seed function
    await seed(payload)

    console.log('✅ Seed completed successfully!')
    process.exit(0)
  } catch (error) {
    console.error('❌ Error seeding database:', error)
    process.exit(1)
  }
}

main()
