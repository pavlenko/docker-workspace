DOCKER_ENV ?= .env
include $(DOCKER_ENV)

cli/php-5.6:
	docker-compose exec dw-php-5.6 bash

cli/php-7.4:
	docker-compose exec dw-php-7.4 bash

cli/php-8.0:
	docker-compose exec dw-php-8.0 bash

cli/php-8.1:
	docker-compose exec dw-php-8.1 bash

cli/php-8.2:
	docker-compose exec dw-php-8.2 bash

cli/node-14:
	docker-compose exec dw-node-14 bash

reload/nginx:
	docker-compose exec -it dw-nginx nginx -s reload

reload/pm2:
	docker-compose restart dw-node-14



# Export database data
# make mysql-5/export db=db_name
mysql-5/export:
	docker-compose exec -T dw-mysql-5.x mysqldump -u root --password=${MYSQL_5_X_ROOT_PASS} $(db) > ./mysql-5.x/dump/$(db).sql

# Create database
# make mysql-5/create db=db_name
mysql-5/create:
	docker-compose exec -T dw-mysql-5.x mysql -u root --password=${MYSQL_5_X_ROOT_PASS} -e "CREATE DATABASE $(db);"

# Import database data
# make mysql-5/import db=db_name file=filepath
mysql-5/import:
	cat $(file) | docker-compose exec -T dw-mysql-5.x mysql -u root --password=${MYSQL_5_X_ROOT_PASS} $(db)



# Export database data
# make mysql-8/export db=db_name
mysql-8/export:
	docker-compose exec -T dw-mysql-8.x mysqldump -u root --password=${MYSQL_8_X_ROOT_PASS} $(db) > ./mysql-8.x/dump/$(db).sql

# Create database
# make mysql-8/create db=db_name
mysql-8/create:
	docker-compose exec -T dw-mysql-8.x mysql -u root --password=${MYSQL_8_X_ROOT_PASS} -e "CREATE DATABASE $(db);"

# Import database data
# make mysql-8/import db=db_name file=filepath
mysql-8/import:
	cat $(file) | docker-compose exec -T dw-mysql-8.x mysql -u root --password=${MYSQL_8_X_ROOT_PASS} $(db)



# Export database data
# make pgsql-16/export db=db_name
pgsql-16/export:
	docker-compose exec -T dw-pgsql-16 pg_dump --clean --if-exists -U ${PGSQL_16_USER} $(db) > ./pgsql-16/dump/$(db).sql

# Create database
# make pgsql-16/create db=db_name
pgsql-16/create:
	docker exec -i dw-pgsql-16 createdb -U ${PGSQL_16_USER} -O ${PGSQL_16_USER} $(db)

# Import database data
# make pgsql-16/import db=db_name file=filepath
pgsql-16/import:
	cat $(file) | docker exec -i dw-pgsql-16 psql -U ${PGSQL_16_USER} -d $(db)
