FROM apache/superset:latest

USER root

# Install system deps needed for psycopg2
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       gcc \
       g++ \
       libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Install only required Python deps
RUN pip install --no-cache-dir psycopg2-binary sqlalchemy sqlalchemy-utils

USER superset

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
