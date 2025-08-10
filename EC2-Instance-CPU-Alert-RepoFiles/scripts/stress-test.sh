#!/usr/bin/env bash
set -euo pipefail
# Install and run a short CPU stress test
if command -v yum >/dev/null 2>&1; then
  sudo yum install -y epel-release || true
  sudo yum install -y stress || sudo yum install -y stress-ng || true
elif command -v apt-get >/dev/null 2>&1; then
  sudo apt-get update -y
  sudo apt-get install -y stress || true
else
  echo "Unsupported package manager. Please install 'stress' or 'stress-ng' manually."
fi

echo "Running CPU stress for 5 minutes..."
stress --cpu 2 --timeout 300 || true
