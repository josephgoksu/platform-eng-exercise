output "ecr_repository_url" {
  value       = aws_ecr_repository.ecr_repo.repository_url
  description = "ECR repository URL"
}

output "ecr_repository_name" {
  value       = aws_ecr_repository.ecr_repo.name
  description = "ECR repository name"
}

output "ecr_repository_arn" {
  value       = aws_ecr_repository.ecr_repo.arn
  description = "ECR repository ARN"
}
