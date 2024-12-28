#!/bin/bash
read -p "Enter the process name: " process_name
pid=$(pgrep -f "$process_name")

if [ -z "$pid" ]; then
    echo "No process found with name $process_name"
else
    echo "Killing process $process_name with PID $pid"
    kill -9 $pid
fi

