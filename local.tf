# Set the local variables
locals {
  cluster_name = "${var.project_name}-eks-${random_string.suffix.result}"
  vpc_name     = "${var.project_name}-vpc-${random_string.suffix.result}"
}

# Generate a random string for the cluster name suffix
resource "random_string" "suffix" {
  length  = 8
  special = false
}
