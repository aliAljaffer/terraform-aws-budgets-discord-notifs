resource "aws_lambda_function" "send_notification" {
  function_name = "alert-discord-channel"
  role          = var.lambda_role_arn
  filename      = data.archive_file.lambda_function.output_path

  runtime    = "python3.13"
  handler    = "main.lambda_handler"
  timeout    = 30
  depends_on = [var.lambda_role_arn]

  environment {
    variables = {
      "WEBHOOK_URL" = var.WEBHOOK_URL
    }
  }
}

