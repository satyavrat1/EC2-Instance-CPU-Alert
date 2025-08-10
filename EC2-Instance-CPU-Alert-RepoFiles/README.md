# EC2 Instance CPU Alert

Lightweight Console POC showing how to send an email when an EC2 instance's CPU > 80% for 5 minutes.

This repository contains:
- `docs/` — step-by-step console instructions and architecture diagram
- `iam/` — minimal IAM policy JSON
- `cloudformation/` — optional CloudFormation template to create SNS + CloudWatch Alarm
- `scripts/` — helper scripts for testing / cleanup

> Use this as a learning POC. For production, convert to IaC and follow org security rules.

---
See `docs/console-steps.md` and `docs/architecture.md` for full details.
