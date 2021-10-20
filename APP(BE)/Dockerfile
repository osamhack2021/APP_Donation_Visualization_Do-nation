FROM mysql:latest

ENV MYSQL_ROOT_PASSWORD 1234
ENV MYSQL_DATABASE do_nation

ADD ./mysql-init-files/ /docker-entrypoint-initdb.d/