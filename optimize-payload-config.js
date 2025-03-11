// This script analyzes and optimizes your PayloadCMS configuration

import fs from 'fs'
import path from 'path'
import { fileURLToPath } from 'url'

const __filename = fileURLToPath(import.meta.url)
const __dirname = path.dirname(__filename)

// Path to your payload.config.ts file
const configPath = path.resolve(__dirname, 'src/payload.config.ts')

async function optimizeConfig() {
  try {
    console.log('Reading PayloadCMS configuration...')

    // Read the config file
    const configContent = fs.readFileSync(configPath, 'utf8')

    // Analyze the configuration
    console.log('\n=== Configuration Analysis ===')

    // Check for pagination settings
    const hasPagination = configContent.includes('pagination:')
    console.log(`Default pagination settings: ${hasPagination ? 'Found' : 'Not found'}`)

    // Check for rateLimit settings
    const hasRateLimit = configContent.includes('rateLimit:')
    console.log(`Rate limiting: ${hasRateLimit ? 'Enabled' : 'Not enabled'}`)

    // Check for graphQL settings
    const hasGraphQL = configContent.includes('graphQL:')
    console.log(`GraphQL configuration: ${hasGraphQL ? 'Found' : 'Not found'}`)

    // Generate optimized configuration
    console.log('\n=== Optimization Recommendations ===')

    let optimizations = []

    if (!hasPagination) {
      optimizations.push(`
  // Add default pagination to limit memory usage
  pagination: {
    defaultLimit: 10,
    maxLimit: 100,
  },`)
    }

    if (!hasRateLimit) {
      optimizations.push(`
  // Add rate limiting to prevent DoS attacks
  rateLimit: {
    window: 5 * 60 * 1000, // 5 minutes
    max: 100, // limit each IP to 100 requests per window
  },`)
    }

    // Check for GraphQL depth limiting
    if (hasGraphQL && !configContent.includes('maxDepth:')) {
      optimizations.push(`
  // Add GraphQL depth limiting to prevent expensive queries
  graphQL: {
    maxDepth: 4, // Limit query depth
    disablePlaygroundInProduction: true,
  },`)
    }

    // Generate the optimized config file
    if (optimizations.length > 0) {
      console.log('Recommended optimizations:')

      // Create a backup of the original file
      const backupPath = `${configPath}.backup`
      fs.copyFileSync(configPath, backupPath)
      console.log(`Original configuration backed up to: ${backupPath}`)

      // Find the position to insert the optimizations (before the collections array)
      const insertPosition = configContent.indexOf('collections:')

      if (insertPosition !== -1) {
        const newConfig =
          configContent.slice(0, insertPosition) +
          optimizations.join('') +
          '\n  ' +
          configContent.slice(insertPosition)

        // Write the optimized config to a new file
        const optimizedPath = `${configPath}.optimized`
        fs.writeFileSync(optimizedPath, newConfig)
        console.log(`Optimized configuration written to: ${optimizedPath}`)
        console.log('\nTo apply these optimizations:')
        console.log(`1. Review the changes in ${optimizedPath}`)
        console.log(`2. If they look good, replace your config file:`)
        console.log(`   cp ${optimizedPath} ${configPath}`)
      } else {
        console.log('Could not determine where to insert optimizations. Manual changes required.')
      }
    } else {
      console.log('Your configuration already includes recommended optimizations.')
    }

    console.log('\n=== Additional Recommendations ===')
    console.log('1. Consider implementing database connection pooling')
    console.log('2. Review your hooks for any memory leaks or inefficient operations')
    console.log('3. Implement caching for frequently accessed data')
    console.log('4. Use the "depth" parameter in relationship queries to limit recursion')
    console.log('5. Consider implementing data archiving for old records')
  } catch (error) {
    console.error('Error optimizing configuration:', error)
  }
}

optimizeConfig()
