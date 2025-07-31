# Budget resource to alert on
resource "aws_budgets_budget" "budget" {
  name         = "personal-budget"
  time_unit    = "MONTHLY"
  budget_type  = "COST"
  limit_unit   = var.limit_unit
  limit_amount = var.limit_amount
  depends_on   = [var.topic_arn] # Must wait for topic to be created before the budget

  notification {
    comparison_operator       = "GREATER_THAN"
    threshold                 = var.budget_threshold
    threshold_type            = "PERCENTAGE"
    notification_type         = "FORECASTED"
    subscriber_sns_topic_arns = toset([var.topic_arn])
  }
}
