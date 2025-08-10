# Console Steps — Create EC2 CPU Alert (detailed)

Follow these steps in the AWS Console using a non-root IAM user.

## 1) SNS Topic
1. Console → Services → **SNS** → **Topics** → **Create topic**
2. Type: Standard, Name: `ec2-cpu-alerts` → **Create topic**
3. Open topic → **Create subscription** → Protocol: **Email** → Endpoint: your-email@example.com
4. Confirm subscription via the email sent to you.

## 2) CloudWatch Alarm
1. Console → Services → **CloudWatch** → **Alarms** → **Create alarm**
2. Select metric → **EC2** → **Per-Instance Metrics** → choose your instance → **CPUUtilization** → Select metric
3. Configure: Statistic: **Average**, Period: **1 minute**, Threshold type: **Static**
   - Condition: `CPUUtilization >= 80` for `5` consecutive periods (5 datapoints within 5 minutes)
4. Configure actions → **Send notification to** → select `ec2-cpu-alerts`
5. Name the alarm: `EC2-High-CPU-{instance-id}` → **Create alarm**

## 3) Test
SSH into the instance and run a CPU load generator:
```bash
# Amazon Linux / RHEL
sudo yum install -y stress || true
stress --cpu 2 --timeout 300
```
or
```bash
python3 -c "while True: pass"
```

Wait for the alarm state to change to ALARM and check your email.

## 4) Cleanup
- CloudWatch → Alarms → select the alarm → Actions → Delete
- SNS → Topics → select `ec2-cpu-alerts` → Delete topic