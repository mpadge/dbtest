FILE=.github/workflows/publish.yaml

all: help

act: ## Run act on workflow file; requires '.env' file with 'github.token' value and 'secrets' file with 'MY_GH_TOKEN'
	act --secret-file secrets --var-file .env -W $(FILE)

help: ## Show this help
	@printf "Usage:\033[36m make [target]\033[0m\n"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
