output "cluster_name" {
  description = "The name of the EKS cluster"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "The endpoint for EKS control plane"
  value       = module.eks.cluster_endpoint
}

output "oidc_provider" {
  description = "The OIDC provider URL"
  value       = module.eks.oidc_provider
}

output "cluster_security_group_id" {
  description = "The ID of the security group associated with the EKS cluster"
  value       = module.eks.cluster_security_group_id
}
