# AWS Budgets Notifications on Discord

## Intro

Send AWS Budget Alerts straight to a Discord channel that you have Webhook Integration permissions for. The `budget_type` is `COST` and the `time_unit` is `MONTHLY`. Users can provide:

- `budget_threshold`
- `limit_unit`
- `limit_amount`

For example, setting a monthly budget of $20 USD and wanting to be alerted when it's forecasted to go over 70% of the budget, you'd set:

- `limit_unit = "USD"`
- `limit_amount = 20`
- `budget_threshold = 70`

## Usage

Three secrets are needed:

- `AWS_ACCESS_KEY`: AWS Access Key with access to Lambda, SNS, Budgets, and IAM. See: https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html
- `AWS_SECRET_KEY`: AWS Secret Key. See: https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html
- `WEBHOOK_URL`: A webhook URL for the targeted Discord channel to send notifications to. Just need the URL, See the \"Making a Webhook\" section here: https://support.discord.com/hc/en-us/articles/228383668-Intro-to-Webhooks

And one last non-secret config variable:

- `AWS_REGION`: Primary region to deploy to

### Python Dependencies

The Lambda function is under `modules/lambda/function/main.py`, feel free to modify the code or change to different runtimes, but you'll need to make the necessary adjustments.

Only the `requests` Python library is needed for the current version. A `local-exec` provisioner runs `pip install` on the `requirements.txt` file.

- requests
- Python 3.13 & pip
- terraform

## Installation

1. Clone the repository: `git clone git@github.com:aliAljaffer/terraform-aws-budgets-discord-notifs.git`

2. Run `terraform init`

3. Edit `terraform.auto.tfvars` and add a `secrets.auto.tfvars` in the root directory, see `secrets.example.auto.tfvars` for required variables.

4. Run `terraform plan` and make sure the plan looks fine and is error-free

5. Run `terraform apply` and you should be good to go!
