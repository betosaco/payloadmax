/**
 * Test script for MatPass constants
 *
 * Run with: node src/seed/test-script.js
 */

import {
  AgencyStatus,
  AgentStatus,
  AllocationStatus,
  BundleStatus,
  BundleUsageEventType,
  ConsumerStatus,
  GroupReservationStatus,
  ReservationStatus,
  SessionStatus,
  SessionConsumerStatus,
} from './enums.js'

import { COLLECTIONS } from './collections.js'

console.log('Enums:')
console.log('AgencyStatus:', AgencyStatus)
console.log('AgentStatus:', AgentStatus)
console.log('AllocationStatus:', AllocationStatus)
console.log('BundleStatus:', BundleStatus)
console.log('BundleUsageEventType:', BundleUsageEventType)
console.log('ConsumerStatus:', ConsumerStatus)
console.log('GroupReservationStatus:', GroupReservationStatus)
console.log('ReservationStatus:', ReservationStatus)
console.log('SessionStatus:', SessionStatus)
console.log('SessionConsumerStatus:', SessionConsumerStatus)

console.log('\nCollections:')
console.log('COLLECTIONS:', COLLECTIONS)
