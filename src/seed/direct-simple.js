/**
 * Direct simple script for testing
 *
 * Run with: node src/seed/direct-simple.js
 */

import dotenv from 'dotenv'
import path from 'path'
import { fileURLToPath } from 'url'
import payload from 'payload'

dotenv.config()

const __dirname = path.dirname(fileURLToPath(import.meta.url))

async function main() {
  console.log('Direct simple script running...')

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

    console.log('Payload initialized successfully!')
    console.log('Available collections:')
    const collections = Object.keys(payload.collections || {})
    console.log(collections.join(', '))

    console.log('Direct simple script completed successfully!')
    process.exit(0)
  } catch (error) {
    console.error('Error running direct simple script:', error)
    process.exit(1)
  }
}

main()
