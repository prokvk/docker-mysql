#! /bin/bash

exec /usr/bin/docker run --rm  --name mysql -e MYSQL_ROOT_PASSWORD=hardcore_pw -p 3306:3306  -v /usr/local/src/mysql_data:/var/lib/mysql mysql