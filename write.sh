#!/bin/bash

#The essence of this file is to check if a website is up and writes the result to a log file

URL="https://www.pinterest.com"

#The variable home is a built in vaiable holding the home directory
LOG_FILE="website_monitor.log"

echo "Starting website monitor for this url"
echo "logging results to $LOG_FILE"

while true; do
    TIMESTAMP=$(date)

    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

    if [ "$HTTP_CODE" = "200" ] ; then
	STATUS="ONLINE"
    elif [ "$HTTP_CODE" = "308" ]; then
	STATUS="REDIRECTED"
    else
        STATUS="UNKNOWN"
    fi

    echo "[$TIMESTAMP ] | URL: $URL | STATUS: $HTTP_CODE" >> website_monitor.log

    echo "Website status currently appending to the log file"
    echo "Kindly check the log file for healthy status check"

    if grep -q "200" website_monitor.log; then 
	echo "Website Still Up!"
    fi 

    
    sleep 300

done





