#!/bin/bash
set -e

# Initialize Superset DB
superset db upgrade

# Create admin user if it doesn't exist
superset fab create-admin \
   --username admin \
   --firstname Superset \
   --lastname Admin \
   --email [email protected] \
   --password admin123 \
   || true

# Initialize roles and default dashboards
superset init

# Finally, start Superset
superset run --host=0.0.0.0 --port=8088
