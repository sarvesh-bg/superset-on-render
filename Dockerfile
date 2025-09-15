# Use the official Apache Superset image
FROM apache/superset:latest

# Install Postgres client driver
RUN pip install psycopg2-binary

# Copy entrypoint script into the container
COPY entrypoint.sh /entrypoint.sh

# Use bash to run the entrypoint (avoids chmod issues on Render)
CMD ["bash", "/entrypoint.sh"]
