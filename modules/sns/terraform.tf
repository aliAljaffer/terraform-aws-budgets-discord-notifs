resource "aws_sns_topic" "budget_notifications" {
  name = "budget-notifications-for-Discord-alerts"
}

resource "aws_sns_topic_subscription" "budget_lambda_subscription" {
  topic_arn = aws_sns_topic.budget_notifications.arn
  protocol  = "lambda"
  endpoint  = var.lambda_function_arn
}

resource "aws_sns_topic_policy" "topic_policy" {
  arn    = aws_sns_topic.budget_notifications.arn
  policy = data.aws_iam_policy_document.sns_topic_policy.json
}
