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

root:
	docker-compose exec wordpress bash

vim:
	docker-compose exec wordpress apt-get update
	docker-compose exec wordpress apt-get install vim -y

browse:
	open http://localhost:13000

down:
	docker-compose down

clean: down
	docker-compose rm --force --stop -v wordpress db
	docker volume rm $(COMPOSE_PROJECT_NAME)_db_data || true
	rm -fr wp-includes/* wp-content/*

.PHONY: up dbcheck install exec root browse down clean
