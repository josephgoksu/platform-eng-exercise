variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "oidc_provider" {
  description = "The OIDC provider URL"
  type        = string
}
