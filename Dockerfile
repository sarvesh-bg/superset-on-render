FROM apache/superset:latest

# Switch to root to install system packages
USER root

# Install build tools and Postgres client libs
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       gcc \
       g++ \
       libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir psycopg2-binary \
    apache-superset[postgres] \
    sqlalchemy sqlalchemy-utils

# Switch back to superset user
USER superset

# Copy entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
