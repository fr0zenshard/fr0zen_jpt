include .env
-include .env.local

main:
	
.PHONY: ci
ci:
	docker-compose build ci
down logs ps restart create:
	docker-compose $@
push pull: # pushing operation only for me :)
	docker-compose $@ ci
log:
	docker-compose logs -f ci

R=docker-compose run --rm
run-ci:
	$R ci
run-sh:
	docker-compose run --rm ci bash
up:
	docker-compose up -d --force-recreate ci

ID=`docker-compose ps -q`
sh:
	docker exec -it $(ID) bash
diff:
	docker diff $(ID)