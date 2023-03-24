normal := \033[0m
yellow := \033[33m\033[1m
green  := \033[32m\033[1m
red    := \033[31m\033[1m

EXAMPLE_APP_DIR := "example"
IMAGE_COVERED_ACTION := "clover-coverage-action"
GITHUB_OUTPUT := "github_output.log"

help:
	@echo "\n\
Usage:                         make $(yellow)<COMMANDS>$(normal)\n\
\n\
Build:                         make build\n\
Test Action:                   make test\n\
\n\
$(yellow)Action Commands:$(normal)\n\
  build                        Build environment\n\
  test                         Run test action\n\
\n\
$(yellow)Test Application Commands:$(normal)\n\
  app-build                    Build application environment\n\
  app-down                     Destroy application containers\n\
  app-test                     Run test application\n\
  app-bash                     Connect to bash of application\n\
"

build: app-build app-test test

action-build-image:
	docker build -t $(IMAGE_COVERED_ACTION) .

test: action-build-image
	rm -rf $(GITHUB_OUTPUT)
	docker run --rm --workdir /app -e "GITHUB_OUTPUT=$(GITHUB_OUTPUT)" -v "$(shell pwd)":"/app" $(IMAGE_COVERED_ACTION) "$(EXAMPLE_APP_DIR)/output/clover.coverage.xml" "60..80" "true"

app-build: app-up
	cd $(EXAMPLE_APP_DIR) && docker compose run --rm app composer install

app-up:
	cd $(EXAMPLE_APP_DIR) && docker compose up -d

app-down:
	cd $(EXAMPLE_APP_DIR) && docker compose down

app-bash: app-up
	cd $(EXAMPLE_APP_DIR) && docker compose run --rm app bash


app-test: app-up
	cd $(EXAMPLE_APP_DIR) && docker compose run --rm app composer test
