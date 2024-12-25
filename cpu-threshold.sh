#!/bin/bash

# Define the CPU usage threshold (in percentage)
THRESHOLD=10

# Define the email to send an alert to (you can also use other methods for alerting)
ALERT_EMAIL="anitha1995d@gmail.com"

# Get the top 5 CPU-consuming processes
TOP_PROCESSES=$(ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6)

# Display the top 5 CPU-consuming processes
echo "Top 5 CPU-consuming processes:"
echo "$TOP_PROCESSES"

# Check if any process exceeds the threshold and send an alert
while read -r pid comm cpu; do
  # Skip the header line
  if [[ "$pid" == "PID" ]]; then
    continue
  fi

  # If the CPU usage exceeds the threshold, send an alert
  if (( $(echo "$cpu > $THRESHOLD" | bc -l) )); then
    ALERT_MESSAGE="ALERT: Process '$comm' (PID $pid) is consuming $cpu% CPU, which exceeds the threshold of $THRESHOLD%."
    
    # Send email alert (ensure mail command is configured on your system)
    echo "$ALERT_MESSAGE" | mail -s "CPU Usage Alert" "$ALERT_EMAIL"
    
    # Optionally, print the alert to the console
    echo "$ALERT_MESSAGE"
  fi
done <<< "$TOP_PROCESSES"
