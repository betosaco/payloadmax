import dotenv from 'dotenv'
import path from 'path'
import { fileURLToPath } from 'url'
import payload from 'payload'
import { seed } from './index'

dotenv.config()

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const configPath = path.resolve(__dirname, '../payload.config.ts')

const seedScript = async (): Promise<void> => {
  try {
    // Initialize Payload with the config path
    await payload.init({
      configPath,
      local: true,
    })

    // Run the seed function
    await seed(payload)

    console.log('✅ Seed completed successfully!')
    process.exit(0)
  } catch (error) {
    console.error('❌ Error seeding database:', error)
    process.exit(1)
  }
}

seedScript()
