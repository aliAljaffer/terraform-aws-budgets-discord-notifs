output "lambda_role_arn" {
  value       = aws_iam_role.lambda_role.arn
  description = "IAM Role for Lambda ARN"
}
