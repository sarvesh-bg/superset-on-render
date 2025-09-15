FROM apache/superset:latest

USER root
RUN pip install psycopg2-binary
USER superset

CMD ["superset", "run", "--host=0.0.0.0", "--port=8088"]
