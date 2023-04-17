DOCKER_ENV ?= .env
include $(DOCKER_ENV)

cli/php-7.3:
	docker-compose exec dw-php-7.3 bash

cli/php-7.4:
	docker-compose exec dw-php-7.4 bash

cli/php-8.0:
	docker-compose exec dw-php-8.0 bash

cli/php-8.1:
	docker-compose exec dw-php-8.1 bash

cli/php-8.2:
	docker-compose exec dw-php-8.2 bash

reload/nginx:
	docker-compose exec -it dw-nginx nginx -s reload
