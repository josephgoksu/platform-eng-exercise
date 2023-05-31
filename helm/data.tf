# Retrieve the Terraform state file for the EKS cluster
data "terraform_remote_state" "eks" {
  backend = "local"
  config = {
    path = "../terraform.tfstate"
  }
}

# Retrieve the EKS cluster configuration
data "aws_eks_cluster" "cluster" {
  name = data.terraform_remote_state.eks.outputs.cluster_name
}

# Retrieve the authentication information for the EKS cluster
data "aws_eks_cluster_auth" "cluster" {
  name = data.terraform_remote_state.eks.outputs.cluster_name
}

# Retrieve the Kubernetes service information for the nginx service
data "kubernetes_service" "nginx" {
  depends_on = [helm_release.nginx]

  metadata {
    name = "nginx"
  }
}

# Retrieve the Kubernetes service information for the flux2 service
data "kubernetes_service" "flux2" {
  depends_on = [helm_release.flux2]

  metadata {
    name = "flux2"
  }
}
