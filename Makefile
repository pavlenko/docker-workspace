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

cli/postgres:
	docker-compose exec dw-postgres bash

reload/nginx:
	docker-compose exec -it dw-nginx nginx -s reload

reload/pm2:
	docker-compose restart dw-node-14

db/import:
	docker-compose exec -T dw-mysql-8.x sh -c "mysql -u root -p mtbawbawskipatrol < /dump/manndev_bbsp.sql"

pgsql-16/export:
	docker-compose exec -T dw-pgsql-16 pg_dump -c -U ${POSTGRES_USER} $(db) > /dump/$(db).sql

pgsql-16/import:
	cat $(file) | docker exec -i dw-pgsql-16 psql -U ${POSTGRES_USER} -d $(db)