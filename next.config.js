import { withPayload } from '@payloadcms/next/withPayload'

import redirects from './redirects.js'

// Ensure consistent URL between server and client
const NEXT_PUBLIC_SERVER_URL = process.env.NEXT_PUBLIC_SERVER_URL || 'http://localhost:3000'

/** @type {import('next').NextConfig} */
const nextConfig = {
  // Force all URLs to use http protocol in development
  assetPrefix: process.env.NODE_ENV === 'development' ? 'http://localhost:3000' : undefined,
  images: {
    domains: [
      'localhost',
      'nuo-lat.vercel.app',
      'xhgnebxb2aexidynkkdm.blob.vercel-storage.com',
      'vercelvendure.s3.amazonaws.com',
      'vercelvendure.s3.us-east-1.amazonaws.com',
    ],
    remotePatterns: [
      {
        hostname: 'localhost',
        protocol: 'http',
      },
      {
        hostname: 'nuo-lat.vercel.app',
        protocol: 'https',
      },
      {
        hostname: '*.blob.vercel-storage.com',
        protocol: 'https',
      },
      {
        hostname: '*.s3.amazonaws.com',
        protocol: 'https',
      },
      {
        hostname: '*.s3.*.amazonaws.com',
        protocol: 'https',
      },
      {
        hostname: 'vercelvendure.s3.amazonaws.com',
        protocol: 'https',
      },
      {
        hostname: 'vercelvendure.s3.us-east-1.amazonaws.com',
        protocol: 'https',
      },
    ],
    // Use unoptimized images in development to avoid protocol issues
    unoptimized: process.env.NODE_ENV === 'development',
  },
  // Disable strict mode to avoid double rendering in development
  reactStrictMode: false,
  redirects,
  // Add custom webpack config to handle SSL issues
  webpack: (config, { isServer, dev }) => {
    // Ignore SSL certificate errors in development
    if (dev && !isServer) {
      config.resolve.alias = {
        ...config.resolve.alias,
        https: 'https-browserify',
        http: 'http-browserify',
      }
    }

    return config
  },
  // Fix pg version mismatch - properly configured outside of experimental
  serverExternalPackages: ['sharp'],
}

export default withPayload(nextConfig)
