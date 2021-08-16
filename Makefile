start:
	@ ./mvnw spring-boot:run

start-db:
	@ docker-compose up -d

stop:
	@ docker-compose down

clean:
	@ docker-compose down --rmi local -v

reset: clean start-db

db-log:
	@ docker-compose logs -f db

db-exec:
	@ docker-compose exec db bash