'use client'

import { getMediaUrl } from '../utilities/mediaUrl'

// Fallback image to display when an image fails to load
const FALLBACK_IMAGE = '/website-template-OG.webp' // Using an existing image from public directory

export const ImageMedia = ({ resource, fill, priority, imgClassName, ...props }) => {
  // Process the URL through our utility function
  const src = resource?.url ? getMediaUrl(resource.url) : null

  // If there's no valid src, don't render the img tag
  if (!src) {
    return null
  }

  // Handle boolean attributes properly
  const imgProps = { ...props }
  if (priority) {
    imgProps.priority = 'true' // Convert boolean to string
  }

  if (fill) {
    // For fill mode, render just the image with absolute positioning
    // This matches how the original component was used in the hero
    return (
      <img
        src={src}
        alt={resource?.alt || ''}
        className={imgClassName}
        style={{
          position: 'absolute',
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          width: '100%',
          height: '100%',
          objectFit: 'cover',
          zIndex: -10, // Match the -z-10 class that was being used
        }}
        {...imgProps}
      />
    )
  }

  // For non-fill mode, just render the image
  return <img src={src} alt={resource?.alt || ''} className={imgClassName} {...imgProps} />
}

// Higher-level Media component that also uses the utility function
export const Media = ({
  src: originalSrc,
  resource,
  alt,
  fill,
  priority,
  imgClassName,
  ...props
}) => {
  // First try to use the originalSrc if provided
  let processedSrc = originalSrc ? getMediaUrl(originalSrc) : null

  // If no originalSrc but we have a resource, use that instead
  if (!processedSrc && resource?.url) {
    processedSrc = getMediaUrl(resource.url)
  }

  // If we still don't have a src but have a resource that might be a string ID
  if (!processedSrc && resource && typeof resource === 'string') {
    processedSrc = getMediaUrl(resource)
  }

  // Handle boolean attributes properly
  const imgProps = { ...props }
  if (priority) {
    imgProps.priority = 'true' // Convert boolean to string
  }

  // If there's no valid src, render a placeholder or return null
  if (!processedSrc) {
    if (fill) {
      // For fill mode with placeholder, render just the image with absolute positioning
      return (
        <img
          src={FALLBACK_IMAGE}
          alt={alt || 'Image placeholder'}
          className={imgClassName}
          style={{
            position: 'absolute',
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            width: '100%',
            height: '100%',
            objectFit: 'cover',
            zIndex: -10, // Match the -z-10 class that was being used
          }}
          {...imgProps}
        />
      )
    }

    // For non-fill mode with placeholder
    return (
      <img
        src={FALLBACK_IMAGE}
        alt={alt || 'Image placeholder'}
        className={imgClassName}
        {...imgProps}
      />
    )
  }

  if (fill) {
    // For fill mode with valid src, render just the image with absolute positioning
    return (
      <img
        src={processedSrc}
        alt={alt || ''}
        className={imgClassName}
        style={{
          position: 'absolute',
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          width: '100%',
          height: '100%',
          objectFit: 'cover',
          zIndex: -10, // Match the -z-10 class that was being used
        }}
        {...imgProps}
      />
    )
  }

  // For non-fill mode with valid src
  return <img src={processedSrc} alt={alt || ''} className={imgClassName} {...imgProps} />
}
