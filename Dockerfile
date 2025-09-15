FROM apache/superset:latest

# Switch to root to install system dependencies
USER root

# Install Postgres driver + SQLAlchemy
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       gcc g++ libpq-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir psycopg2-binary sqlalchemy sqlalchemy-utils

# Copy entrypoint script and fix permissions as root
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Switch back to superset user for security
USER superset

# Run Superset with entrypoint
CMD ["/entrypoint.sh"]
