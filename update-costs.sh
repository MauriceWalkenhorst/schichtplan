#!/bin/bash
# Script to fetch session stats and update cost tracking

OUTPUT_FILE="/root/.openclaw/workspace/walter_projekte/usage_stats.json"

# Get session status
STATUS=$(curl -s -H "Authorization: Bearer $(cat /root/.openclaw/.token 2>/dev/null || echo '')" http://127.0.0.1:18789/api/session_status 2>/dev/null || echo '{}')

# Parse and calculate costs
python3 << EOF
import json
import subprocess
import re
from datetime import datetime

# Default values
input_tokens = 0
output_tokens = 0

# Try to get actual session stats
try:
    result = subprocess.run(
        ['curl', '-s', 'http://127.0.0.1:18789/api/session_status'],
        capture_output=True, text=True, timeout=5
    )
    if result.returncode == 0:
        data = json.loads(result.stdout)
        if 'totalTokens' in data:
            total = data.get('totalTokens', 0)
            # Rough estimate: 70% input, 30% output
            input_tokens = int(total * 0.7)
            output_tokens = int(total * 0.3)
except:
    pass

# Calculate costs
# MiniMax M2.5: $0.015/1K input, $0.06/1K output
input_cost = input_tokens * 0.015 / 1000
output_cost = output_tokens * 0.06 / 1000
cost_today = input_cost + output_cost

# Read current file
try:
    with open('$OUTPUT_FILE', 'r') as f:
        current = json.load(f)
        total_cost = current.get('totalCost', 0) + cost_today
except:
    total_cost = cost_today

output = {
    "totalInputTokens": input_tokens,
    "totalOutputTokens": output_tokens,
    "lastUpdate": datetime.utcnow().isoformat() + "Z",
    "costToday": round(cost_today, 2),
    "totalCost": round(total_cost, 2),
    "models": [
        {
            "name": "MiniMax M2.5",
            "inputTokens": input_tokens,
            "outputTokens": output_tokens,
            "cost": round(cost_today, 2)
        }
    ]
}

with open('$OUTPUT_FILE', 'w') as f:
    json.dump(output, f, indent=2)

print(f"Updated costs: ${cost_today:.2f} today, ${total_cost:.2f} total")
