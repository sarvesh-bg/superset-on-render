#!/bin/bash
set -e

# Upgrade the database
superset db upgrade

# Create admin user (if not exists)
superset fab create-admin \
   --username admin \
   --firstname Superset \
   --lastname Admin \
   --email admin@superset.com \
   --password admin123 || true

# Initialize roles and permissions
superset init

# Start Superset with Gunicorn (Render requires binding to $PORT)
exec gunicorn \
   -w 4 \
   -k gevent \
   --timeout 300 \
   -b 0.0.0.0:${PORT:-8088} \
   "superset.app:create_app()"
