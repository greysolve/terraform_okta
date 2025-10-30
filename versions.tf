# versions.tf  (replace everything with this)
terraform {
  cloud {
    organization = "greysolve" # use your exact org slug
    workspaces {
      name = "auth0-scim-learning"
    }
  }

  required_version = ">= 1.5.0"

  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = "~> 1.1"
    }
  }
}
