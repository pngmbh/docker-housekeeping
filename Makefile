.PHONY: build cron push

REGISTRY:=r.planetary-quantum.com
IMAGE:=quantum-public/cron

.DEFAULT_GOAL := help

help: ## Show help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

cron: build push ## build & push new image

build: ## build cron image
	docker build -t $(REGISTRY)/$(IMAGE):latest .

push: ## publish cron image
	docker push $(REGISTRY)/$(IMAGE):latest
