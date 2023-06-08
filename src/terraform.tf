terraform {
  required_version = ">=1.3.0"

  required_providers {
    github = {
      source  = "integrations/github"
      version = "5.12.0"
    }
  }
}

variable "github" {
  type = object({
    org        = string
    repository = string
  })
  description = "GitHub Organization and repository name"
  default = {
    org        = "pasqdvt-org" # CHANGE ME WITH YOUR ORG
    repository = "example-secrets-menagement-bounty"
  }
}

variable "github_token" {
  type        = string
  sensitive   = true
  description = "Personal PAT GITHUB_TOKEN"
}

provider "github" {
  owner          = var.github.org
  write_delay_ms = "200"
  read_delay_ms  = "200"
}

# CASE 1) manage secrets (create/update)
resource "github_actions_secret" "repository_secret" {
  repository      = var.github.repository
  secret_name     = "REPOSITORY_SECRET_KEY"
  plaintext_value = "REPOSITORY_SUPER_SECRET_VALUE"
}

# CASE 2) manage environment secrets (create/update)
# resource "github_actions_environment_secret" "repository_secret_environment" {
#   repository      = var.github.repository
#   environment     = "environment"
#   secret_name     = "REPOSITORY_ENVIRONMENT_SECRET_KEY"
#   plaintext_value = "REPOSITORY_ENVIRONMENT_SUPER_SECRET_VALUE"
# }
