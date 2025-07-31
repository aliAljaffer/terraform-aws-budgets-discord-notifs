output "budget_arn" {
  value       = aws_budgets_budget.budget.arn
  description = "Budget resource ARN"
}
