normal := \033[0m
yellow := \033[33m\033[1m
green  := \033[32m\033[1m
red    := \033[31m\033[1m

include .env

export COMPOSE_PROJECT_NAME

help:
	@echo "\n\
Usage:                         make $(yellow)<COMMANDS>$(normal)\n\
\n\
Build:                         make build\n\
Test:                          make test\n\
\n\
$(yellow)Management Commands:$(normal)\n\
  build                        Build environment\n\
  test                         Run testing of action\n\
  example-bash                 Connect to bash in example env\n\
  example-test                 Run tests of example env\n\
  example-down                 Destroy example containers\n\
"

build: example-build example-test test

action-build-image:
	docker build -t $(IMAGE_COVERED_ACTION) .

test: action-build-image
	rm -rf $(GITHUB_OUTPUT)
	docker run --rm --workdir /app -e "GITHUB_OUTPUT=$(GITHUB_OUTPUT)" -v "$(shell pwd)":"/app" $(IMAGE_COVERED_ACTION) "$(EXAMPLE_DIR)/output/clover.coverage.xml" "60..80" "true"

example-build: example-composer-install

example-up:
	cd $(EXAMPLE_DIR) && docker compose up -d

example-down:
	cd $(EXAMPLE_DIR) && docker compose down

example-bash: example-up
	cd $(EXAMPLE_DIR) && docker compose run --rm example bash

example-composer-install: example-up
	cd $(EXAMPLE_DIR) && docker compose run --rm example composer install

example-test: example-up
	cd $(EXAMPLE_DIR) && docker compose run --rm example composer test
