# ----------------------------------------------------------------------------------------------------------------------
#
#      ____             __                _       ___                      __
#     / __ \____  _____/ /_____  _____   | |     / (_)___  ____ __________/ /
#    / / / / __ \/ ___/ //_/ _ \/ ___/   | | /| / / /_  / / __ `/ ___/ __  / 
#   / /_/ / /_/ / /__/ ,< /  __/ /       | |/ |/ / / / /_/ /_/ / /  / /_/ /  
#  /_____/\____/\___/_/|_|\___/_/        |__/|__/_/ /___/\__,_/_/   \__,_/   
#  - Makefile to automate Docker tasks                                                                     
#
# ----------------------------------------------------------------------------------------------------------------------

# ----------------------------------------------------------------------------------------------------------------------
# GENERAL
# ----------------------------------------------------------------------------------------------------------------------

docker_label:
	@echo '    ____             __                _       ___                      __'
	@echo '   / __ \____  _____/ /_____  _____   | |     / (_)___  ____ __________/ /'
	@echo '  / / / / __ \/ ___/ //_/ _ \/ ___/   | | /| / / /_  / / __ `/ ___/ __  / '
	@echo ' / /_/ / /_/ / /__/ ,< /  __/ /       | |/ |/ / / / /_/ /_/ / /  / /_/ /  '
	@echo '/_____/\____/\___/_/|_|\___/_/        |__/|__/_/ /___/\__,_/_/   \__,_/   '

docker_init:
	@while [ -z "$$CONTINUE" ] && [ "$$CONTINUE" != "1" ] && [ "$$CONTINUE" != "2" ]; do \
		echo ""; \
		echo "1. Compose"; \
		echo "2. Exit"; \
		echo ""; \
		read -r -p "> Select option to continue: $$CONTINUE" CONTINUE; \
		if [ "$$CONTINUE" = "1" ]; then \
			make docker_compose; \
		elif [ "$$CONTINUE" = "2" ]; then \
			echo "Exiting..."; \
		else \
			CONTINUE=""; \
		fi ; \
	done; \

# ----------------------------------------------------------------------------------------------------------------------
# COMPOSE
# ----------------------------------------------------------------------------------------------------------------------

# Docker Wizard utilities to interact with Docker compose
# https://docs.docker.com/compose/reference/overview/
docker_compose:
	@while [ -z "$$CONTINUE" ] && [ "$$CONTINUE" != "1" ] && [ "$$CONTINUE" != "2" ]; do \
		echo ""; \
		echo "1. Run"; \
		echo "2. Exit"; \
		echo ""; \
		read -r -p "> Select option to continue: $$CONTINUE" CONTINUE; \
		if [ "$$CONTINUE" = "1" ]; then \
			make docker_compose_run; \
		elif [ "$$CONTINUE" = "2" ]; then \
			echo "Exiting..."; \
		else \
			CONTINUE=""; \
		fi ; \
	done; \

# Compose Docker up
docker_compose_run:
	@echo ""
	@echo "> Composing PostgreSQL and server containers..."; \
	docker-compose -f ./CI/docker-compose.local.yml up