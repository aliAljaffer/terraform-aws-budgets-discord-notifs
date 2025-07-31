data "aws_iam_policy_document" "sns_topic_policy" {
  policy_id = "__default_policy_ID"
  statement {
    actions = [
      "SNS:Publish",
    ]
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["budgets.amazonaws.com"]
    }

    resources = [
      aws_sns_topic.budget_notifications.arn,
    ]

    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values   = [data.aws_caller_identity.current.account_id]
    }

    sid = "PublishSNSFromBudgets"
  }
}
data "aws_caller_identity" "current" {}
