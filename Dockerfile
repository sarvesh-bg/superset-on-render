FROM apache/superset:latest

USER root
RUN pip install psycopg2-binary
USER superset

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]

