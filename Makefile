CONFIG_DIR = /etc/config/parimparjob
CONFIG_FILE = $(CONFIG_DIR)/application.properties
LOG_CONFIG_FILE = $(CONFIG_DIR)/log4j.xml

configure:
	@ [ ! -f ".env" ] && cp .env.example .env || true
	@ [ ! -f "$(CONFIG_FILE)" ] && sudo mkdir -p $(CONFIG_DIR) && sudo cp application.properties $(CONFIG_FILE) || true
	@ [ ! -f "$(LOG_CONFIG_FILE)" ] && sudo mkdir -p $(CONFIG_DIR) && sudo cp log4j.xml $(LOG_CONFIG_FILE) || true

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