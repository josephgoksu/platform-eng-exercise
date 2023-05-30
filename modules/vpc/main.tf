# Define a module named "vpc" with source "terraform-aws-modules/vpc/aws" and version "3.19.0"
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"

  # Set the name of the VPC to the value of the "vpc_name" variable
  name = var.vpc_name

  # Set the CIDR block for the VPC to "10.0.0.0/16"
  # Set the availability zones to the first three available zones in the region
  cidr = "10.0.0.0/16"
  azs  = slice(data.aws_availability_zones.available.names, 0, 3)

  # Define the private and public subnets for the VPC
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

  # Enable NAT gateway and set it to use a single NAT gateway
  # Enable DNS hostnames for the VPC
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  # Set tags for the public and private subnets
  public_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                    = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"           = 1
  }
}

# Define the availability zones
data "aws_availability_zones" "available" {}
