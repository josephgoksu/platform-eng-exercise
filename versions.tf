# Declare the required providers for this Terraform configuration
terraform {
  required_providers {
    # Declare the AWS provider and specify the version to use
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.47.0"
    }

    # Declare the Random provider and specify the version to use
    random = {
      source  = "hashicorp/random"
      version = "~> 3.4.3"
    }

    # Declare the TLS provider and specify the version to use
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.4"
    }

    # Declare the CloudInit provider and specify the version to use
    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.2.0"
    }
  }

  # Specify the required version of Terraform for this configuration
  required_version = "~> 1.3"
}
