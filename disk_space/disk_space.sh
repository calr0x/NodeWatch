#!/bin/bash

# This script checks disk space of /dev/sda and alerts when its greater than the threshold that's set (75% default)
# Setting to change:
# SPACE_THRESHOLD: Set this to what percentage it should alert above.

SPACE_THRESHOLD="75"

SPACE=$(df -m / | grep sda | awk '{print $5}')
SPACE=$(sed 's|%||' <<< $SPACE)
echo Disk space is $SPACE% full.

if [ $SPACE -ge $SPACE_THRESHOLD ]; then
  /root/OT-NodeWatch/data/send.sh "Disk space is $SPACE% full."
fi