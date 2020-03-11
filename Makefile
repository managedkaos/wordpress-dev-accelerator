COMPOSE_PROJECT_NAME=$(shell basename $(PWD) | tr '[:upper:]' '[:lower:]')

up:
	docker-compose up -d

dbcheck: up
	docker-compose exec db /usr/local/bin/dbcheck.sh

install: dbcheck
	docker-compose exec wordpress /usr/local/bin/install-cli.sh
	docker-compose exec --user www-data wordpress /usr/local/bin/install-wp.sh

exec:
	docker-compose exec --user www-data wordpress bash

browse:
	open http://localhost:13000

down:
	docker-compose down

clean: down
	docker-compose rm --force --stop -v wordpress db
	docker volume rm $(COMPOSE_PROJECT_NAME)_db_data || true

.PHONY: up dbcheck install exec browse down clean
