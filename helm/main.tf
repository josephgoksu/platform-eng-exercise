# This resource block deploys an nginx Helm chart from the bitnamicharts OCI registry.
resource "helm_release" "nginx" {
  count = 0

  name       = "nginx"
  repository = "oci://registry-1.docker.io/bitnamicharts"
  chart      = "nginx"

  values = [
    file("${path.module}/nginx-values.yaml")
  ]
}

# This resource block deploys a flux2 Helm chart from the fluxcd-community Helm chart repository.
resource "helm_release" "flux2" {
  count = 1

  name       = "flux2"
  repository = "https://fluxcd-community.github.io/helm-charts"
  chart      = "flux2"

  namespace        = "flux-system"
  create_namespace = true
}
