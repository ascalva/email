SHELL := /bin/bash

NODE_VERSION   := 20

# ---- Config ----
TF      := terraform
TFD     := terraform-docs
TF_DIR  := terraform
PLAN    := tfplan.out
AWS_REG := us-east-1

# Optional tools
TFLINT  := tflint

# ---- Default ----
.PHONY: help setup docs plan deploy destroy lint clean setup-semantic-release
help:
	@echo ""
	@echo "Terraform helper commands:"
	@echo "  make setup   -> Install / verify dependencies"
	@echo "  make plan    -> Terraform plan (saved)"
	@echo "  make deploy  -> Terraform apply"
	@echo "  make lint    -> fmt + validate + tflint"
	@echo ""


# ---- Setup ----
setup-semantic-release:
	@pnpm install --frozen-lockfile

setup:
	@echo "Verifying dependencies..."
	@command -v terraform >/dev/null || (echo "terraform not installed" && exit 1)
	@command -v aws >/dev/null || (echo "aws cli not installed" && exit 1)
	@command -v $(TFLINT) >/dev/null || echo "tflint not installed (optional)"
	@command -v terraform-docs >/dev/null || echo "terraform-docs not installed"

	@echo "Terraform version:"
	@terraform version

	@echo "Checking AWS credentials..."
	@aws sts get-caller-identity >/dev/null || (echo "AWS auth not configured" && exit 1)

	@echo "Terraform init..."
	@$(TF) -chdir=$(TF_DIR) init -upgrade

	@pnpm install --frozen-lockfile

	@echo "Setup complete"

# ---- Docs ----
docs:
	@echo "Creating Terraform docs..."
	@${TFD} markdown table --recursive --output-file README.md --output-mode inject ${TF_DIR}

# ---- Plan ----
plan:
	@echo "Creating Terraform plan..."
	@$(TF) -chdir=$(TF_DIR) plan \
		-out=$(PLAN)
	@echo "Plan saved to $(PLAN)"

# ---- Deploy ----
deploy:
	@echo "Applying Terraform plan..."
	@if [ ! -f ${TF_DIR}/$(PLAN) ]; then \
		echo "!! Plan file not found. Run 'make plan' first !!"; \
		exit 1; \
	fi
	@$(TF) -chdir=$(TF_DIR) apply $(PLAN)
	@echo "Deploy complete"

# ---- Destroy ----
destroy:
	@echo "Destroying Terraform deployment..."
	@$(TF) -chdir=$(TF_DIR) destroy
	@echo "Destroy complete"

# ---- Lint / Validate ----
lint:
	@echo "terraform fmt..."
	@$(TF) -chdir=$(TF_DIR) fmt -recursive

	@echo "terraform validate..."
	@$(TF) -chdir=$(TF_DIR) validate

	@if command -v $(TFLINT) >/dev/null; then \
		echo "tflint..."; \
		$(TFLINT) --recursive; \
	else \
		echo "tflint not installed, skipping"; \
	fi

	@echo "Lint complete"

# ---- Clean ----
clean:
	@echo "Cleaning artifacts..."
	@rm -f $(PLAN)
	@rm -rf .terraform
	@echo "Cleaned"
