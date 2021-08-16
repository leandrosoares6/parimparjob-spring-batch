CONFIG_DIR = /etc/config/parimparjob
CONFIG_FILE = $(CONFIG_DIR)/application.properties

configure:
	@ [ ! -f "$(CONFIG_FILE)" ] && sudo mkdir -p $(CONFIG_DIR) && sudo cp application.properties $(CONFIG_FILE) || true

start: configure
	@ export $$(cat .env | xargs) && ./mvnw spring-boot:run

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