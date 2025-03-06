'use client'

import { useLivePreview } from '@payloadcms/live-preview-react'
import React from 'react'

// This component can be used to provide custom configuration for the live preview
export const LivePreviewConfig: React.FC<{
  children: React.ReactNode
}> = ({ children }) => {
  useLivePreview({
    serverURL:
      typeof window !== 'undefined'
        ? `${window.location.protocol}//${window.location.host}`
        : process.env.NEXT_PUBLIC_SERVER_URL || '',
    depth: 2,
    // Fallback data will be used if provided to avoid showing loading states
    initialData: {},
  })

  return <>{children}</>
}
