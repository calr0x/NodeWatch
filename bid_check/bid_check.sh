#!/bin/bash

# This script checks the logs for "Accepting" which indicates a bid.
# Setting to change:
# BID_INTERVAL: Set this to how far back in minutes to search the log for mentions of "Accepting".
# This value should match the CRON schedule. For example, Every 15 minutes
# CRON should run this script which checks the logs for the past 15 minutes.

BID_INTERVAL="15m"

BIDS=$(docker logs --since $BID_INTERVAL otnode | grep Accepting | wc -l)
echo $BIDS

if [ $BIDS -eq 0 ]; then
  /root/OT-NodeWatch/data/send.sh "Has not bid in the last $BID_INTERVAL"
fi
