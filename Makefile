include .env
export $(shell sed 's/=.*//' .env)

.DEFAULT_GOAL := default

default:
	@echo Available targets:
	@echo - install
	@echo - uninstall
	@echo - start
	@echo - stop

install: minio-console.env
	docker-compose up -d minio
	docker-compose run --rm \
		--volume $(abspath ./minio):/tmp/minio \
		--entrypoint "" \
		mc bash /tmp/minio/init.sh
	docker-compose up -d minio-console
	@echo
	@echo "You can access the minio console at http://localhost:9090"
	@echo "User: ${MINIO_CONSOLE_USER}"
	@echo "Password: ${MINIO_CONSOLE_PASSWORD}"

uninstall:
	docker-compose stop
	docker-compose rm -f
	docker volume rm -f ${COMPOSE_PROJECT_NAME}_minio_data
	docker volume rm -f ${COMPOSE_PROJECT_NAME}_mc_data

start:
	docker-compose up -d --scale mc=0

stop:
	docker-compose stop

minio-console.env:
	echo "CONSOLE_PBKDF_PASSPHRASE=$(shell bash ./random-password.sh)" > minio-console.env
	echo "CONSOLE_PBKDF_SALT=$(shell bash ./random-password.sh)" >> minio-console.env
