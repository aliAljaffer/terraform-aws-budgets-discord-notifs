variable "lambda_function_arn" {
  type        = string
  sensitive   = false
  description = "Lambda Function ARN"
}
variable "budget_arn" {
  type        = string
  sensitive   = false
  description = "AWS Budget Alert ARN"
}
