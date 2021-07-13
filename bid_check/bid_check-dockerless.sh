#!/bin/bash

# This script checks the logs for "Accepting" which indicates a bid.
# Setting to change:
# BID_CHECK_ENABLED: Set to false to disable bid notifications.
# CHECK_INTERVAL: Set this to how far back to search the log for mentions of "Accepting".
# This value should match the CRON schedule. For example, Every 1 hour
# CRON should run this script which checks the logs for the past 1 hour.

CHECK_INTERVAL="1 hour ago"
BID_CHECK_ENABLED="true"

BIDS=$(journalctl -u otnode.service --since "$CHECK_INTERVAL" | grep Accepting | wc -l)
#echo Bids: $BIDS

if [ $BIDS -eq 0 ]; then
  /root/OT-settings/data/send.sh "Has not bid since $CHECK_INTERVAL, restarting node"
  systemctl restart otnode
fi

JOBS=$(journalctl -u otnode.service --since "$CHECK_INTERVAL" | grep 've been chosen' | wc -l)
#echo Jobs: $JOBS

OFFER_ID=($(journalctl -u otnode.service --since "$CHECK_INTERVAL" | grep 've been chosen' | grep -Eo '0x[a-z0-9]+'))

#echo Array: ${#OFFER_ID[@]}
if [ $BID_CHECK_ENABLED == "true" ]
then
  for i in "${OFFER_ID[@]}"
  do
    TOKEN_ARRAY=($(curl -sX GET "https://v5api.othub.info/api/Job/detail/$i" -H  "accept: text/plain" | jq '.TokenAmountPerHolder' | cut -d'"' -f2))
    JOBTIME_ARRAY=($(curl -sX GET "https://v5api.othub.info/api/Job/detail/$i" -H  "accept: text/plain" | jq '.HoldingTimeInMinutes'))
    DAYS=$(expr ${JOBTIME_ARRAY[@]} / 60 / 24)
    /root/OT-Settings/data/send.sh "Job awarded: $DAYS days at ${TOKEN_ARRAY[@]} TRAC"
  done
fi
