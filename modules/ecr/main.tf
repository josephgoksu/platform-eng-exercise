# Create an ECR repository named <project_name>-ecr-repo
resource "aws_ecr_repository" "ecr_repo" {
  # Name of the ECR repository
  name = "${var.project_name}-ecr-repo"

  # Set the image tag mutability to immutable
  image_tag_mutability = "IMMUTABLE"

  # Enable image scanning on push
  image_scanning_configuration {
    scan_on_push = true
  }

  # Add tags to the ECR repository
  tags = {
    Name = "${var.project_name}-ecr-repo"
  }
}
