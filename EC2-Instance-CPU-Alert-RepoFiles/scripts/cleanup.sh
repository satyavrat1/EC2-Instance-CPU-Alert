#!/usr/bin/env bash
set -euo pipefail
if ! command -v aws >/dev/null 2>&1; then
  echo "AWS CLI not found. Install and configure it first."
  exit 1
fi

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <alarm-name> <sns-topic-arn>"
  echo "Example: $0 EC2-High-CPU-i-0123456789abcdef0 arn:aws:sns:us-east-1:123456789012:ec2-cpu-alerts"
  exit 1
fi

ALARM_NAME="$1"
TOPIC_ARN="$2"

echo "Deleting CloudWatch alarm: $ALARM_NAME"
aws cloudwatch delete-alarms --alarm-names "$ALARM_NAME"

echo "Deleting SNS topic: $TOPIC_ARN"
aws sns delete-topic --topic-arn "$TOPIC_ARN"

echo "Done."
