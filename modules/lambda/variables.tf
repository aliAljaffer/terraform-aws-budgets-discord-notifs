variable "WEBHOOK_URL" {
  type        = string
  sensitive   = true
  description = "Webhook URL taken from the targeted Discord channel"
}

variable "lambda_role_arn" {
  type        = string
  sensitive   = false
  description = "IAM Role for Lambda ARN"
}
