module "lambda" {
  source          = "./modules/lambda"
  WEBHOOK_URL     = var.WEBHOOK_URL
  lambda_role_arn = module.iam.lambda_role_arn
}

module "iam" {
  source        = "./modules/iam"
  function_name = module.lambda.function_name
  topic_arn     = module.sns.arn
}

module "sns" {
  source              = "./modules/sns"
  lambda_function_arn = module.lambda.arn
  budget_arn          = module.budgets.budget_arn
}

module "budgets" {
  source           = "./modules/budgets"
  topic_arn        = module.sns.arn
  budget_threshold = var.budget_threshold # Threshold after which the budget alert triggers (85% of limit_amount)
  limit_unit       = var.limit_unit       # Limit unit (U.S. Dollars)
  limit_amount     = var.limit_amount     # Limit as a number (20 U.S. Dollars)
}
