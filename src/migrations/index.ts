import * as migration_20250306_172343 from './20250306_172343'
import * as migration_20250306_204046 from './20250306_204046'
import * as migration_20250307_211946 from './20250307_211946'

export const migrations = [
  {
    up: migration_20250306_172343.up,
    down: migration_20250306_172343.down,
    name: '20250306_172343',
  },
  {
    up: migration_20250306_204046.up,
    down: migration_20250306_204046.down,
    name: '20250306_204046',
  },
  {
    up: migration_20250307_211946.up,
    down: migration_20250307_211946.down,
    name: '20250307_211946',
  },
]
