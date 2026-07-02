.PHONY: help setup validate test lint generate clean pdf preview build build-full infra fonts

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

setup: ## Install all dependencies and bootstrap the project
	npm install --no-audit --no-fund
	@echo "Dependencies installed. Run 'make validate' to verify."

validate: ## Validate all skill structures
	bash scripts/validate-skills.sh

integrity: ## Run full base integrity check (cross-platform)
	node scripts/integrity-check.js

test: validate integrity ## Run all tests + integrity check

build: validate integrity pdf ## Full pipeline: validate → integrity → build PDFs

build-full: build fonts ## Full pipeline + font status

lint: ## Run ESLint
	npm run lint

generate: ## Regenerate AGENTS.md from skill directory
	bash scripts/generate-agents-md.sh

manifest: ## Regenerate skills.json manifest
	bash scripts/generate-skills-manifest.sh

clean: ## Remove generated artifacts
	rm -rf generated-examples/pdfs/*.pdf
	@echo "Cleaned generated PDFs"

preview: ## Generate a sample PDF to verify the pipeline works
	node scripts/quickstart.js

pdf: ## Convert all example markdown files to PDF
	node scripts/batch-convert-to-pdf.js

diagrams: ## Render all architecture diagrams
	node scripts/diagram-gen.js

check-deps: ## Check dependency health
	bash deps/resolve.sh

infra: ## Show infrastructure status (cache + session)
	npm run infra:status

validate-output: ## Validate output against skill schemas
	npm run validate:output

router-test: ## Test the skill router
	node infrastructure/skill-router.js

fonts: ## Show font status
	npm run fonts:status

fonts-install: ## Download free fonts (Caveat, Noto)
	npm run fonts:install

quickstart: setup validate ## Full bootstrap: install + validate
	@echo "Repo ready. Run 'make preview' to generate a sample PDF."
