# Create the IAM role for the EBS CSI driver
module "irsa-ebs-csi" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version = "4.7.0"

  # Create the role
  create_role = true
  # Set the role name
  role_name = "AmazonEKSTFEBSCSIRole-${var.cluster_name}"
  # Set the OIDC provider URL
  provider_url = var.oidc_provider
  # Set the IAM policy ARN
  role_policy_arns = [data.aws_iam_policy.ebs_csi_policy.arn]
  # Set the fully qualified subjects for the OIDC provider
  oidc_fully_qualified_subjects = ["system:serviceaccount:kube-system:ebs-csi-controller-sa"]
}

# Create the EBS CSI driver addon
resource "aws_eks_addon" "ebs-csi" {
  # Set the cluster name
  cluster_name = var.cluster_name
  # Set the addon name
  addon_name = "aws-ebs-csi-driver"
  # Set the addon version
  addon_version = "v1.5.2-eksbuild.1"
  # Set the IAM role ARN for the service account
  service_account_role_arn = module.irsa-ebs-csi.iam_role_arn
  # Set the tags for the addon
  tags = {
    "eks_addon" = "ebs-csi"
    "terraform" = "true"
  }
}

# Define the IAM policy for the EBS CSI driver
data "aws_iam_policy" "ebs_csi_policy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
}
