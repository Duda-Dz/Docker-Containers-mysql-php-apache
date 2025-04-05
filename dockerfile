FROM mysql:8.0
ENV MYSQL_ROOT_PASSWORD=D4d0ssql
COPY ./dados.sql /docker-entrypoint-initdb.d/

