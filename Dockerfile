
FROM apache/superset:latest

USER root

# Install Postgres driver + other common drivers
RUN pip install --no-cache-dir psycopg2-binary \
    apache-superset[postgres] \
    sqlalchemy sqlalchemy-utils

USER superset

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
