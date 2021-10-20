#!/bin/bash
  
docker build --tag mysqldb .
docker run --name=mysql-db -d -p 3306:3306 mysqldb  --character-set-server=utf8 --collation-server=utf8_general_ci --default-authentication-plugin=mysql_native_password