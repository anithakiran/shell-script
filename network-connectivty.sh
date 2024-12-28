#!/bin/bash
ping -c 1 google.com &>/dev/null

curl -s http://ipinfo.io/ip #to get public ip address


if [ $? -eq 0 ]; then
    echo "Internet is connected"
else
    echo "No internet connection"
fi

