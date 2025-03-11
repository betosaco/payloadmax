// storage-adapter-import-placeholder
import { vercelPostgresAdapter } from '@payloadcms/db-vercel-postgres'
import { vercelBlobStorage } from '@payloadcms/storage-vercel-blob'

import sharp from 'sharp' // sharp-import
import path from 'path'
import { buildConfig, PayloadRequest } from 'payload'
import { fileURLToPath } from 'url'

import { Categories } from './collections/Categories'
import { Media } from './collections/Media'
import { Pages } from './collections/Pages'
import { Posts } from './collections/Posts'
import { Users } from './collections/Users'
import { Footer } from './Footer/config'
import { Header } from './Header/config'
import { plugins } from './plugins'
import { defaultLexical } from '@/fields/defaultLexical'
import { getServerSideURL } from './utilities/getURL'

// Import MatPass collections
import { Tenants } from './collections/Tenants'
import { Agencies } from './collections/Agencies'
import { Agents } from './collections/Agents'
import { Consumers } from './collections/Consumers'
import { SessionTypes } from './collections/SessionTypes'
import { Contexts } from './collections/Contexts'
import { TimeSlots } from './collections/TimeSlots'
import { Allocations } from './collections/Allocations'
import { Bundles } from './collections/Bundles'
import { BundleUsageEvents } from './collections/BundleUsageEvents'
import { Reservations } from './collections/Reservations'
import { GroupReservations } from './collections/GroupReservations'
import { Sessions } from './collections/Sessions'
import { SessionConsumers } from './collections/SessionConsumers'
import { AltSessionAgents } from './collections/AltSessionAgents'
import { Tags } from './collections/Tags'
import { Addresses } from './collections/Addresses'
import { AgentSessionTypeAgencies } from './collections/AgentSessionTypeAgencies'

const filename = fileURLToPath(import.meta.url)
const dirname = path.dirname(filename)

export default buildConfig({
  admin: {
    components: {
      // The `BeforeLogin` component renders a message that you see while logging into your admin panel.
      // Feel free to delete this at any time. Simply remove the line below and the import `BeforeLogin` statement on line 15.
      beforeLogin: ['@/components/BeforeLogin'],
      // The `BeforeDashboard` component renders the 'welcome' block that you see after logging into your admin panel.
      // Feel free to delete this at any time. Simply remove the line below and the import `BeforeDashboard` statement on line 15.
      beforeDashboard: ['@/components/BeforeDashboard'],
    },
    importMap: {
      baseDir: path.resolve(dirname),
    },
    user: Users.slug,
    livePreview: {
      breakpoints: [
        {
          label: 'Mobile',
          name: 'mobile',
          width: 375,
          height: 667,
        },
        {
          label: 'Tablet',
          name: 'tablet',
          width: 768,
          height: 1024,
        },
        {
          label: 'Desktop',
          name: 'desktop',
          width: 1440,
          height: 900,
        },
      ],
    },
  },
  // This config helps us configure global or default features that the other editors can inherit
  editor: defaultLexical,
  db: vercelPostgresAdapter({
    pool: {
      connectionString: process.env.POSTGRES_URL || '',
    },
  }),
  collections: [
    // Original collections
    Pages,
    Posts,
    Media,
    Categories,
    Users,

    // MatPass collections
    Tenants,
    Agencies,
    Agents,
    Consumers,
    SessionTypes,
    Contexts,
    TimeSlots,
    Allocations,
    Bundles,
    BundleUsageEvents,
    Reservations,
    GroupReservations,
    Sessions,
    SessionConsumers,
    AltSessionAgents,
    Tags,
    Addresses,
    AgentSessionTypeAgencies,
  ],
  cors: [getServerSideURL()].filter(Boolean),
  globals: [Header, Footer],
  plugins: [
    ...plugins,
    vercelBlobStorage({
      collections: {
        [Media.slug]: {
          // Enable the storage adapter for the media collection
          adapter: true,
        },
      },
      token: process.env.BLOB_READ_WRITE_TOKEN || '',
    }),
  ],
  secret: process.env.PAYLOAD_SECRET,
  sharp,
  typescript: {
    outputFile: path.resolve(dirname, 'payload-types.ts'),
  },
  jobs: {
    access: {
      run: ({ req }: { req: PayloadRequest }): boolean => {
        // Allow logged in users to execute this endpoint (default)
        if (req.user) return true

        // If there is no logged in user, then check
        // for the Vercel Cron secret to be present as an
        // Authorization header:
        const authHeader = req.headers.get('authorization')
        return authHeader === `Bearer ${process.env.CRON_SECRET}`
      },
    },
    tasks: [],
  },
})
