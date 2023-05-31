terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">=2.9.0"
    }

    flux = {
      source = "fluxcd/flux"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.3.2"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.52.0"
    }
  }
  required_version = "~> 1.3"
}
