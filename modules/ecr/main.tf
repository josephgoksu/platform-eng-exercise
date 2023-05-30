# Create an ECR repository named "my-ecr-repo"
resource "aws_ecr_repository" "ecr_repo" {
  name = "${var.project_name}-ecr-repo"
}
