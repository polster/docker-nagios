.PHONY: run

docker-build:
	docker build --tag polster/docker-nagios .

docker-run-foreground:
	docker run --name nagios -p 0.0.0.0:8090:80 polster/docker-nagios:latest

docker-run-background:
	docker run -d --name nagios -p 0.0.0.0:8090:80 polster/docker-nagios:latest

docker-compose-run:
	docker-compose up -d
	docker ps -a

docker-destroy-env:
	docker stop nagios
	docker rm nagios nagios-data
