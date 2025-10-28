help: ## Show help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n",$$1,$$2}'

.PHONY: up
up:  ## Run Postgres on port 5432 and Adminer on port 5433
	docker compose up --build

connect: ## Connect to the Postgres database
	docker compose exec -it db psql --username=user --dbname=db
	
clean: ## Stop and remove containers
	docker compose down --volumes

sql: ## Run scripts/insert_users_and_orders.sql script
	docker compose exec db psql --username=user --dbname=db -f /scripts/insert_users_and_orders.sql

restart: clean up ## Restart the containers

challenge_1: ## Run scripts/challenge_1.sql script
	docker compose exec db psql --username=user --dbname=db -f /scripts/challenge_1.sql

challenge_2: ## Run scripts/challenge_2.sql script
	docker compose exec db psql --username=user --dbname=db -f /scripts/challenge_2.sql
