init:
	docker-compose run airflow-scheduler bash initialize.sh

start:
	docker-compose up -d

stop:
	docker-compose down

rm:
	docker-compose down --volumes
