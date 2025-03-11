/**
 * Test MCP Query Script
 *
 * This script tests the MCP query tool provided by Cursor.
 * It runs a simple query to list available tables and their row counts.
 *
 * Usage:
 * - Run with: npm run test:mcp-query
 */

import { mcp__query } from 'cursor'

/**
 * Execute an MCP query using the Cursor-provided tool
 * @param {string} sql - SQL query to execute
 * @returns {Promise<Array>} - Query results
 */
async function executeMcpQuery(sql) {
  try {
    console.log(`Executing MCP query: ${sql}`)
    const result = await mcp__query({ sql })

    if (!result || !result.content) {
      console.warn('Query returned no content')
      return []
    }

    return result.content
  } catch (error) {
    console.error('Error executing MCP query:', error)
    throw error
  }
}

/**
 * Main function to test MCP queries
 */
async function main() {
  try {
    console.log('Testing MCP query tool...')

    // Get list of tables
    console.log('\n--- Listing tables ---')
    const tablesQuery = `
      SELECT 
        table_name, 
        (SELECT count(*) FROM "${table_name}") as row_count
      FROM 
        information_schema.tables 
      WHERE 
        table_schema = 'public' 
        AND table_type = 'BASE TABLE'
      ORDER BY 
        table_name
    `

    const tables = await executeMcpQuery(tablesQuery)

    if (tables.length === 0) {
      console.log('No tables found in the database.')
    } else {
      console.log(`Found ${tables.length} tables:`)
      tables.forEach((table) => {
        console.log(`- ${table.table_name}: ${table.row_count} rows`)
      })
    }

    // Sample data from a few tables
    if (tables.length > 0) {
      console.log('\n--- Sampling data from tables ---')

      // Sample from first table
      const firstTable = tables[0].table_name
      console.log(`\nSampling from ${firstTable}:`)
      const sampleQuery = `SELECT * FROM "${firstTable}" LIMIT 3`
      const sampleData = await executeMcpQuery(sampleQuery)

      if (sampleData.length === 0) {
        console.log(`No data found in ${firstTable}.`)
      } else {
        console.log(`Sample data (${sampleData.length} rows):`)
        console.dir(sampleData, { depth: 3 })
      }

      // Get column information for the first table
      console.log(`\nColumn information for ${firstTable}:`)
      const columnsQuery = `
        SELECT 
          column_name, 
          data_type, 
          is_nullable
        FROM 
          information_schema.columns
        WHERE 
          table_name = '${firstTable}'
        ORDER BY 
          ordinal_position
      `

      const columns = await executeMcpQuery(columnsQuery)
      columns.forEach((column) => {
        console.log(
          `- ${column.column_name}: ${column.data_type} (${column.is_nullable === 'YES' ? 'nullable' : 'not nullable'})`,
        )
      })
    }

    console.log('\nMCP query test completed successfully')
    process.exit(0)
  } catch (error) {
    console.error('MCP query test failed:', error)
    process.exit(1)
  }
}

main()
