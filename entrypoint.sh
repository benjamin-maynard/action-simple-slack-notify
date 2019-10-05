#!/bin/sh -l

if [[ -z "${INPUT_SLACKWEBHOOK}" ]]; then
  echo "Missing slackWebhook Input"
  exit 1
fi
if [[ -z "${INPUT_SLACKCHANNEL}" ]]; then
  echo "Missing slackChannel Input"
  exit 1
fi
if [[ -z "${INPUT_SLACKUSERNAME}" ]]; then
  echo "Missing slackUsername Input"
  exit 1
fi
if [[ -z "${INPUT_SLACKMESSAGE}" ]]; then
  echo "Missing slackMessage Input"
  exit 1
fi

curl -X POST -H 'Content-type: application/json' --data '{"text":"$INPUT_SLACKMESSAGE", "channel":"INPUT_SLACKCHANNEL", "name":"$INPUT_SLACKUSERNAME"}' $INPUT_SLACKWEBHOOK