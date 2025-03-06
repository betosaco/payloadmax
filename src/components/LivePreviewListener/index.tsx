'use client'
import { getClientSideURL } from '@/utilities/getURL'
import { RefreshRouteOnSave as PayloadLivePreview } from '@payloadcms/live-preview-react'
import { useRouter } from 'next/navigation'
import React, { useEffect, useState } from 'react'

export const LivePreviewListener: React.FC = () => {
  const router = useRouter()
  const [serverURL, setServerURL] = useState<string>('')

  useEffect(() => {
    // Get the server URL on the client side to ensure it's accurate
    const url = getClientSideURL()
    setServerURL(url)
  }, [])

  if (!serverURL) return null

  return <PayloadLivePreview refresh={router.refresh} serverURL={serverURL} />
}
