
# Create the EKS cluster
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.5.1"

  # Set the cluster name
  cluster_name = var.cluster_name
  # Set the Kubernetes version
  cluster_version = "1.24"

  # Set the VPC ID and subnet IDs
  vpc_id     = var.vpc_id
  subnet_ids = var.private_subnets
  # Enable public access to the cluster endpoint
  cluster_endpoint_public_access = true

  # Set the default AMI type for managed node groups
  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"
  }

  # Define the managed node groups
  eks_managed_node_groups = {
    one = {
      name = "node-group-1"

      instance_types = ["t3.small"]

      min_size     = 1
      max_size     = 3
      desired_size = 2
    }

    two = {
      name = "node-group-2"

      instance_types = ["t3.small"]

      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
  }
}

# Addon: EBS CSI driver
module "ebs_csi_driver" {
  # Enable the EBS CSI driver if the "enable_ebs_csi_driver" variable is set to true
  count = var.enable_ebs_csi_driver ? 1 : 0

  # Use the EKS addons module to add the EBS CSI driver to the cluster
  source = "./addons"

  # Set the name of the cluster to the local variable "cluster_name"
  cluster_name = var.cluster_name

  # Use the OIDC provider from the EKS module output
  oidc_provider = module.eks.oidc_provider
}
