output "id" {
  value       = aws_sns_topic.budget_notifications.id
  description = "SNS Topic ID"
}
output "arn" {
  value       = aws_sns_topic.budget_notifications.arn
  description = "SNS Topic ARN"
}
