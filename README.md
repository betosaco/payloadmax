# PayloadMax

A PayloadCMS-based application with PostgreSQL database integration.

## Features

- PayloadCMS admin interface
- Next.js frontend
- PostgreSQL database integration
- User authentication and management

## Setup Instructions

### Prerequisites

- Node.js (v18 or higher)
- pnpm package manager
- PostgreSQL database

### Installation

1. Clone the repository:
```bash
git clone https://github.com/betosaco/payloadmax.git
cd payloadmax
```

2. Install dependencies:
```bash
pnpm install
```

3. Set up environment variables:
Create a `.env` file in the root directory with the following variables:
```
PAYLOAD_SECRET=your_secret_key
DATABASE_URI=your_postgresql_connection_string
```

4. Database Setup:
You can restore the included database dump:
```bash
psql your_database_name < neondb_dump.sql
```

5. Start the development server:
```bash
pnpm dev
```

The application will be available at http://localhost:3000 and the admin panel at http://localhost:3000/admin.

## Admin Access

Default admin credentials:
- Email: betosaco@gmail.com
- Password: 123456

## License

MIT
