# MCP to Payload CMS Migration

This directory contains scripts for migrating data from MCP (Cursor's integrated database) to Payload CMS collections.

## Available Scripts

- `npm run migrate:mcp-cursor`: Run the migration from MCP to Payload CMS
- `npm run test:mcp-query`: Test the MCP query tool (Note: This will fail when run from the command line)

## Using the MCP Query Tool in Cursor

The MCP query tool is only available when running within the Cursor AI environment. To use it:

1. Open the file `src/seed/mcp-query-template.js`
2. Copy the entire file content
3. Paste it into the Cursor AI chat
4. Modify the SQL query as needed
5. Ask Cursor AI to execute the query

## Running the Migration in Cursor

Since the MCP query tool is only available within the Cursor AI environment, we've provided a script that can be run directly in Cursor:

1. Open the file `src/seed/run-migration-in-cursor.js`
2. Copy the entire file content
3. Paste it into the Cursor AI chat
4. Ask Cursor AI to execute the migration

This script will:
- Check if the MCP database has data
- If empty, seed sample data into Payload CMS
- Log the process and results

## Migration Process

The migration process involves:

1. **Exploring the MCP Database**: Use the MCP query tool to explore the database structure and understand the data.
2. **Configuring the Migration**: Update the `mcp-cursor-migration.js` file to map MCP tables to Payload CMS collections.
3. **Running the Migration**: Use the Cursor AI to execute the migration script.

## Controlling the Migration

You can control which parts of the migration run using environment variables:

```bash
# Run only tenant and agency migrations
MIGRATE_TENANTS=true MIGRATE_AGENCIES=true MIGRATE_AGENTS=false npm run migrate:mcp-cursor

# Control batch size
BATCH_SIZE=100 npm run migrate:mcp-cursor

# Seed sample data if MCP database is empty
SEED_SAMPLE_DATA=true npm run migrate:mcp-cursor
```

## Sample Data Seeding

If the MCP database is empty, the migration script can seed sample data into Payload CMS. This is useful for development and testing purposes.

To enable sample data seeding:

```bash
SEED_SAMPLE_DATA=true npm run migrate:mcp-cursor
```

The sample data includes:
- Tenants
- Agencies
- Agents
- Relationships between these entities

You can customize the sample data by modifying the `seedSampleData` function in `mcp-cursor-migration.js`.

## Troubleshooting

- **Error: Cannot find package 'cursor'**: This error occurs when trying to run scripts that use the MCP query tool from the command line. The MCP query tool is only available within the Cursor AI environment.
- **Payload Initialization Errors**: Make sure your `.env` file has the correct `PAYLOAD_SECRET` value.
- **Empty MCP Database**: If the MCP database is empty, set `SEED_SAMPLE_DATA=true` to seed sample data instead of migrating.

## Migration Strategy

The migration follows these steps:

1. Initialize Payload CMS
2. Check if MCP database has data
3. If data exists, migrate in order of dependencies (e.g., tenants before agencies)
4. If no data exists and `SEED_SAMPLE_DATA` is true, seed sample data
5. Store ID mappings to maintain relationships
6. Process data in batches to avoid memory issues
7. Log progress and errors for monitoring

## Adding New Migrations

To add a new migration:

1. Create a new migration function in `mcp-cursor-migration.js`
2. Add the function call to the `main` function
3. Update the `idMap` object to include the new collection

Example:

```javascript
async function migrateCustomers() {
  if (!isMigrationEnabled('customers')) {
    console.log('Skipping customers migration (disabled by env var)');
    return;
  }

  console.log('Starting customers migration...');
  
  try {
    // Implementation here
  } catch (error) {
    console.error('Error in customers migration:', error);
  }
}

// Then in main():
await migrateCustomers();
```

## Migration Script

The main migration script is `mcp-migration.js`. This script connects to your MCP PostgreSQL database, fetches data from each table, and creates corresponding documents in your Payload CMS collections.

## Prerequisites

Before running the migration script, make sure you have:

1. A running PostgreSQL database with your MCP data
2. Payload CMS set up with the required collections
3. Environment variables configured in your `.env` file

## Environment Variables

Add the following environment variables to your `.env` file:

```
# PostgreSQL Connection
POSTGRES_USER=your_postgres_user
POSTGRES_PASSWORD=your_postgres_password
POSTGRES_HOST=localhost
POSTGRES_PORT=5432
POSTGRES_DATABASE=your_database_name

# Payload Secret
PAYLOAD_SECRET=your_payload_secret

# Optional: Batch Size for Migration
# Controls how many records are processed at once
# Smaller batch sizes use less memory but take longer
MIGRATION_BATCH_SIZE=100

# Optional: Enable/Disable Specific Migrations
# Set to "false" to skip specific migrations
MIGRATE_TENANTS=true
MIGRATE_AGENCIES=true
MIGRATE_AGENTS=true
# ... and so on for other collections
```

A sample `.env.migration.example` file is provided in this directory. You can copy it to your project root and rename it to `.env` to get started.

## Running the Migration

### Step 1: Check Database Connections

Before running the full migration, it's recommended to check your database connections:

```bash
npm run check:connection
```

This will verify that both your PostgreSQL and Payload CMS connections are working correctly and display information about the available tables and collections.

### Step 2: Run the Migration

To run the migration script, use the following command:

```bash
npm run migrate:mcp
```

This will:

1. Connect to your PostgreSQL database
2. Initialize Payload CMS
3. Migrate data from each table to the corresponding Payload collection
4. Log the progress and any errors encountered

## Migration Order

The migration script processes tables in the following order to respect dependencies:

1. Tenants
2. Agencies
3. Agents
4. Consumers
5. Session Types
6. Contexts
7. Time Slots
8. Allocations
9. Bundles
10. Reservations
11. Group Reservations
12. Sessions
13. Session Consumers
14. Alt Session Agents
15. Tags
16. Addresses
17. Agent Session Type Agencies

## Batch Processing

The migration script processes data in batches to improve performance and reduce memory usage. You can configure the batch size using the `MIGRATION_BATCH_SIZE` environment variable. The default batch size is 100 records.

## Selective Migration

You can selectively enable or disable specific migrations using environment variables. For example, to skip the migration of tenants, set `MIGRATE_TENANTS=false` in your `.env` file.

## Troubleshooting

If you encounter issues during migration:

1. Check the console logs for specific error messages
2. Verify your database connection settings
3. Ensure all required collections are defined in Payload CMS
4. Check that your database tables have the expected structure
5. Try reducing the batch size if you're experiencing memory issues
6. Selectively migrate specific collections to isolate problems

## Data Mapping

The script maintains a mapping between original IDs in the MCP database and new IDs in Payload CMS to preserve relationships between entities. This ensures that references between documents are maintained during the migration process.

## Customization

If you need to customize the migration process:

1. Modify the individual migration functions in `mcp-migration.js`
2. Add additional mapping entries in the `idMap` object for new collections
3. Update the `migrateData` function to include or exclude specific collections
4. Adjust the batch processing logic in the `processBatches` function 