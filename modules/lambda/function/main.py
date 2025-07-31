import sys
import json
import requests
import os
sys.path.insert(0, './python')


def lambda_handler(event, context):
    webhook_url = os.environ.get("WEBHOOK_URL")
    message_content = event["Records"][0]["Sns"]["Message"]

    payload = {
        "content": message_content
    }

    headers = {
        "Content-Type": "application/json"
    }

    try:
        response = requests.post(
            webhook_url, data=json.dumps(payload), headers=headers)
        response.raise_for_status()
        print(
            f"Discord notification sent successfully: {response.status_code}")
    except requests.exceptions.RequestException as e:
        print(f"Error sending Discord notification: {e}")
        return {
            'statusCode': e.response.status_code,
            'body': json.dumps('Failed to send notification', e)
        }

    return {
        'statusCode': 200,
        'body': json.dumps('Notification sent!')
    }
