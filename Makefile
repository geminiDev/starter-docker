.DEFAULT_GOAL := test
.PHONY: install

install:
	@echo test install
docker-container-rm-all:
	@echo "Suppression a tout les containers"
	@echo "Listing : $(shell docker ps -a --format "{{.ID}} {{.Names}} {{.Image}} {{.State}}")"
	docker container rm $(shell docker ps -a -q) -f
docker-container-list:
	@echo "Lists: $(shell docker ps -a --format "{{.ID}} {{.Names}} {{.Image}} {{.State}}")"
docker-images:
	@echo "Lists: $(shell docker ps -a --format "{{.ID}} {{.Names}} {{.Image}} {{.State}}")"
docker-run: 
	docker build -t test_web .
	docker volume inspect test-vol
	docker run --name testcontainer -ti -p "80:80" -v test-vol:/var/www/html test_web:latest
docker-delete-volume:
	docker volume rm test-vol
docker-create-volume:
	docker volume create test-vol
docker-composer-up:
	docker compose  --env-file ./docker.env build
	docker compose  --env-file ./docker.env up --force-recreate
docker-exec-httpd:
	docker exec -it httpd-server bash
docker-exec-php:
	docker exec -it php-server bash
docker-rm-images:
	@echo "Listing : $(shell docker ps -a --format "{{.ID}} {{.Names}} {{.Image}} {{.State}}")"
	docker image rm $(shell docker image ls -aq)