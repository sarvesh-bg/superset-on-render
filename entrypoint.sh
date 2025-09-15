
#!/bin/bash
set -e

# Upgrade database schema
superset db upgrade

# Create or update admin user
superset fab create-admin \
  --username admin \
  --firstname Superset \
  --lastname Admin \
  --email admin@example.com \
  --password admin123 \
  || true

# Initialize roles and default dashboards
superset init

# Start Superset
exec superset run --host 0.0.0.0 --port 8088
