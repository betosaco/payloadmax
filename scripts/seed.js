/**
 * Script to run the seed command
 *
 * Usage: node scripts/seed.js
 */

import { execSync } from 'child_process'

try {
  console.log('🌱 Running seed command...')

  // Execute the seed command
  execSync('node src/seed/seed-script.js', { stdio: 'inherit' })

  console.log('✅ Seed completed successfully!')
} catch (error) {
  console.error('❌ Error running seed command:', error.message)
  process.exit(1)
}
