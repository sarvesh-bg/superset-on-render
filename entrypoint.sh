#!/bin/bash
set -e

# Upgrade Superset DB
superset db upgrade

# Create admin user if not exists
superset fab create-admin \
   --username admin \
   --firstname Superset \
   --lastname Admin \
   --email admin@superset.com \
   --password admin || true

# Init roles and permissions
superset init

# Start Superset
superset run -h 0.0.0.0 -p 8080 --with-threads --reload --debugger
