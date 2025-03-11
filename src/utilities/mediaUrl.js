/**
 * Utility function to get consistent media URLs between server and client
 * This ensures we avoid hydration mismatches with http vs https
 */
export const getMediaUrl = (path) => {
  if (!path) return null

  // If it's already a full URL (including Vercel Blob URLs)
  if (path.startsWith('http')) {
    // Force http protocol for localhost in development
    if (path.includes('localhost:3000')) {
      const httpUrl = path.replace('https://', 'http://')
      return httpUrl
    }

    // In production, use the URL as is (including Vercel Blob URLs)
    return path
  }

  // If it's a relative URL starting with /api, use it as is
  if (path.startsWith('/api/')) {
    return path
  }

  // Handle URLs that might be coming from Vercel Blob Storage
  // These could be in various formats depending on how they're stored

  // For URLs that already include /media/ or /uploads/ paths
  if (path.includes('/media/') || path.includes('/uploads/')) {
    const baseUrl = process.env.NODE_ENV === 'development' ? 'http://localhost:3000' : ''
    const fullUrl = `${baseUrl}${path.startsWith('/') ? path : `/${path}`}`
    return fullUrl
  }

  // For URLs that might be direct file references (common in Payload CMS)
  if (path.includes('.') && !path.startsWith('/')) {
    // This might be a direct filename like "image.jpg"
    const baseUrl = process.env.NODE_ENV === 'development' ? 'http://localhost:3000' : ''
    const fullUrl = `${baseUrl}/api/media/${path}`
    return fullUrl
  }

  // For other paths, try to construct a proper URL to the Payload API
  // This is a fallback that tries to handle various formats
  const baseUrl = process.env.NODE_ENV === 'development' ? 'http://localhost:3000' : ''

  // Check if this might be a Vercel Blob Storage URL format
  if (path.includes('vercel-storage') || path.includes('blob.vercel-storage')) {
    return path // Return as is, it's likely already properly formatted
  }

  // Default case - assume it's a media ID or path that needs to be prefixed
  const fullUrl = `${baseUrl}/api/media/${path}`
  return fullUrl
}
