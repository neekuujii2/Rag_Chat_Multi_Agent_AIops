SHELL := /bin/bash
COMPOSE := docker compose

.PHONY: up down build lint test scan local-cert terraform-plan terraform-apply helm-template kustomize-prod

up:
	$(COMPOSE) up -d --build

down:
	$(COMPOSE) down -v

build:
	$(COMPOSE) build

lint:
	npm run lint

test:
	pytest backend/tests

scan:
	trivy fs .
	bandit -r backend/app
	semgrep scan --config auto backend frontend

local-cert:
	./infra/scripts/generate-local-certs.sh

terraform-plan:
	cd infra/terraform/environments/production && terraform init && terraform plan

terraform-apply:
	cd infra/terraform/environments/production && terraform init && terraform apply

helm-template:
	helm template rag-platform infra/helm/rag-platform

kustomize-prod:
	kubectl kustomize infra/k8s/overlays/production
