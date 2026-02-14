#!/bin/bash
# Script to fetch and update shifts from Quinyx

ICAL_URL="https://app.quinyx.com/webcal/?id=3072ebeaa4267d7b73850319a397ecf1"
OUTPUT_FILE="/root/.openclaw/workspace/walter_projekte/shifts.json"

# Fetch the iCal data
DATA=$(curl -s -L "$ICAL_URL" -H "User-Agent: Mozilla/5.0" --max-time 10)

# Parse iCal to JSON using Python
python3 << EOF
import json
import re
from datetime import datetime

ical_data = """$DATA"""

events = []
current_event = {}

for line in ical_data.split('\n'):
    line = line.strip()
    
    if line == 'BEGIN:VEVENT':
        current_event = {}
    elif line == 'END:VEVENT':
        if current_event:
            events.append(current_event)
    elif line.startswith('DTSTART'):
        match = re.search(r'DTSTART.*?:(\d{4})(\d{2})(\d{2})T(\d{2})(\d{2})(\d{2})', line)
        if match:
            current_event['start'] = f"{match.group(1)}-{match.group(2)}-{match.group(3)}T{match.group(4)}:{match.group(5)}:{match.group(6)}"
    elif line.startswith('DTEND'):
        match = re.search(r'DTEND.*?:(\d{4})(\d{2})(\d{2})T(\d{2})(\d{2})(\d{2})', line)
        if match:
            current_event['end'] = f"{match.group(1)}-{match.group(2)}-{match.group(3)}T{match.group(4)}:{match.group(5)}:{match.group(6)}"
    elif line.startswith('SUMMARY:'):
        current_event['title'] = line.replace('SUMMARY:', '').strip()
    elif line.startswith('DESCRIPTION:'):
        current_event['description'] = line.replace('DESCRIPTION:', '').strip()
    elif line.startswith('LOCATION:'):
        current_event['location'] = line.replace('LOCATION:', '').strip()

# Sort by start date
events.sort(key=lambda x: x.get('start', ''))

# Convert to desired format
output = []
for e in events:
    output.append({
        "title": e.get('title', ''),
        "start": e.get('start', ''),
        "end": e.get('end', ''),
        "description": e.get('description', ''),
        "location": e.get('location', '')
    })

with open('$OUTPUT_FILE', 'w') as f:
    json.dump(output, f, indent=2)

print(f"Updated {len(output)} shifts")
EOF
