/**
 * MCP Query Template
 *
 * This file serves as a template for using the MCP query tool directly in Cursor.
 * Copy and paste this code into the Cursor AI chat to execute MCP queries.
 *
 * Usage:
 * 1. Copy this entire file
 * 2. Paste it into the Cursor AI chat
 * 3. Modify the SQL query as needed
 * 4. Ask Cursor AI to execute the query
 */

// Example query to list all tables
const listTablesQuery = `
  SELECT 
    table_name, 
    (SELECT count(*) FROM information_schema.columns WHERE table_name = t.table_name) as column_count
  FROM 
    information_schema.tables t
  WHERE 
    table_schema = 'public' 
    AND table_type = 'BASE TABLE'
  ORDER BY 
    table_name
`

// Example query to get columns for a specific table
const getColumnsQuery = `
  SELECT 
    column_name, 
    data_type, 
    is_nullable
  FROM 
    information_schema.columns
  WHERE 
    table_name = 'YOUR_TABLE_NAME'
  ORDER BY 
    ordinal_position
`

// Example query to sample data from a table
const sampleDataQuery = `
  SELECT * FROM "YOUR_TABLE_NAME" LIMIT 5
`

// Example query to count rows in a table
const countRowsQuery = `
  SELECT COUNT(*) FROM "YOUR_TABLE_NAME"
`

// Choose one of the queries above or write your own
const queryToExecute = listTablesQuery

// Execute the query using the mcp__query tool
// This will be handled by Cursor AI when you paste this code into the chat
mcp__query({ sql: queryToExecute })
