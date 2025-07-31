output "arn" {
  value       = aws_lambda_function.send_notification.arn
  description = "Lambda Function ARN"
}

output "function_name" {
  value       = aws_lambda_function.send_notification.function_name
  description = "Lambda Function name"
}
