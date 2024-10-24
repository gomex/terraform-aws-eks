terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = var.region
  default_tags {
    tags = {
      Environment   = var.tag_environment
      Component     = var.tag_component
      ComponentRole = var.tag_component_role
      Owner         = var.tag_owner
    }
  }
}