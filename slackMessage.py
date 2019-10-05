# Import Dependencies
from os import environ
import json
import requests

# Get Environment Variables
slack_webhook    = environ.get("INPUT_SLACKWEBHOOK")
slack_message   = environ.get("INPUT_SLACKMESSAGE")
slack_username  = environ.get("INPUT_SLACKUSERNAME")

# Validate Environment Variables
if slack_webhook == None:
    print("The slackWebhook input must be set")
    exit(1)

if slack_message == None:
    print("The slackMessage input must be set")
    exit(1)    

if slack_username == None:
    slack_username = "Simple Slack Notify"

# Define Message Class
class Message(object):
    def __init__(self, username, text):
        self.username = username
        self.text = text

# Create Payload from Message Class, conver to JSON
slack_payload = Message(slack_username, slack_message)
slack_payload_json = json.dumps(slack_payload.__dict__)

# Make request to Slack
r = requests.post(url = slack_webhook, data = slack_payload_json) 

if r.status_code != 200:
    print("Error sending message to Slack: " + r.text)
    exit(1)