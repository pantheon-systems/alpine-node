REGISTRY := quay.io/getpantheon
APP := alpine-node

all: build push


build: ## build the docker container
		docker build -t $(REGISTRY)/$(APP) .

push: ## push node container to $(REGISTRY)
	docker push $(REGISTRY)/$(APP)

help: ## print list of tasks and descriptions
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help

.PHONY: all help deploy build
