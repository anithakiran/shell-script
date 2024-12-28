#!/bin/bash
read -p "Enter service name: " service
if systemctl is-active --quiet "$service"; then
    echo "$service is running"
else
    echo "$service is not running"
fi


# systemctl: This is the command used to interact with systemd, the system and service manager 
# for many Linux distributions.

# is-active: This option checks whether a given service is currently active (running).
#  It returns a status indicating if the service is active, inactive, or in another state 
#  (such as failed, etc.).

# --quiet: This flag suppresses the output of the systemctl is-active command. Normally, 
# systemctl would output the status (e.g., "active", "inactive"), but with --quiet,
#  it only sets the exit status without printing anything to the terminal