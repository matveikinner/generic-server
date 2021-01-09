include docker.mk

.PHONY: help docker

PROJECT_NAME = $(notdir $(PWD))
PORT ?= 3000

export PORT

docker: docker_label docker_init

label:
	@echo '   _____ __   _ ____                        __   ______     _                __    '
	@echo '  / ___// /__(_) / /____   ____ _____  ____/ /  / ____/____(_)__  ____  ____/ /____'
	@echo '  \__ \/ //_/ / / / ___/  / __ `/ __ \/ __  /  / /_  / ___/ / _ \/ __ \/ __  / ___/'
	@echo ' ___/ / ,< / / / (__  )  / /_/ / / / / /_/ /  / __/ / /  / /  __/ / / / /_/ (__  ) '
	@echo '/____/_/|_/_/_/_/____/   \__,_/_/ /_/\__,_/  /_/   /_/  /_/\___/_/ /_/\__,_/____/  '

help: label docker_help