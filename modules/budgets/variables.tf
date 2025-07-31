variable "topic_arn" {
  type        = string
  sensitive   = false
  description = "SNS Topic ARN"
}
variable "limit_amount" {
  type        = number
  sensitive   = false
  default     = 20
  description = "Amount to use in `limit_unit` units. See: https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_budgets_Spend.html"
}
variable "budget_threshold" {
  type      = number
  sensitive = false
  default   = 85
}
variable "limit_unit" {
  type        = string
  sensitive   = false
  default     = "USD"
  description = "Unit to use for the `limit_amount` variable. See: https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_budgets_Spend.html"
}

