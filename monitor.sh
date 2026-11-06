#!/bin/bash

#The essence of this script is to monitor the health status of OceanOfPdf.com website

LOG_FILE="monitor_website.log"

URL="https://www.pinterest.com"

while true; do

    TIME=$(date)

    echo "Getting status code from the website"

   STATUS_CODE=$(curl -L -s -o /dev/null -w "%{http_code}" "$URL")



   if [ "$STATUS_CODE" = "200" ]; then
	echo "Website is accessible"
   elif [ "$STATUS_CODE" = "403" ]; then
         echo "Unauthorized access"
   else
          echo "Status unknown"
   fi


    echo "[$TIME] | URL:$URL | STATUS:$STATUS_CODE" >> $LOG_FILE

    sleep 10
done



