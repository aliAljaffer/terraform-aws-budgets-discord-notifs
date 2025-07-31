variable "AWS_ACCESS_KEY" {
  type        = string
  sensitive   = true
  description = "AWS Access Key with access to Lambda, SNS, Budgets, and IAM. See: https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html"
}
variable "AWS_REGION" {
  type        = string
  sensitive   = false
  description = "Primary region to deploy to"
}
variable "AWS_SECRET_KEY" {
  type        = string
  sensitive   = true
  description = "AWS Secret Key. See: https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html"
}
variable "WEBHOOK_URL" {
  type        = string
  sensitive   = true
  description = "A webhook URL for the targeted Discord channel to send notifications to. Just need the URL, See the \"Making a Webhook\" section here: https://support.discord.com/hc/en-us/articles/228383668-Intro-to-Webhooks"
}

variable "limit_amount" {
  type        = number
  sensitive   = false
  default     = 20
  description = "Amount to use in `limit_unit` units. See: https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_budgets_Spend.html"
}
variable "budget_threshold" {
  type        = number
  sensitive   = false
  default     = 85
  description = "Threshold (as percentage by default) after which the Budget Alert triggers"
}
variable "limit_unit" {
  type        = string
  sensitive   = false
  default     = "USD"
  description = "Unit to use for the `limit_amount` variable. See: https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_budgets_Spend.html"
}
