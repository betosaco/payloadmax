/**
 * Simple seed script for testing
 *
 * Run with: npx payload run src/seed/simple-seed.js
 */

export default async (payload) => {
  console.log('Simple seed script running...')
  console.log('Payload instance:', payload ? 'Available' : 'Not available')

  if (payload) {
    try {
      // Try to list collections
      console.log('Available collections:')
      const collections = Object.keys(payload.collections || {})
      console.log(collections.join(', '))

      // Try to create a simple document
      if (collections.length > 0) {
        const firstCollection = collections[0]
        console.log(`Trying to create a document in ${firstCollection}...`)

        const doc = await payload.create({
          collection: firstCollection,
          data: {
            name: 'Test Document',
            createdAt: new Date().toISOString(),
          },
        })

        console.log(`Created document: ${doc.id}`)
      }
    } catch (error) {
      console.error('Error:', error.message)
    }
  }

  console.log('Simple seed script completed.')
}
