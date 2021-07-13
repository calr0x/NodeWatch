#!/bin/bash

# This script checks disk space of /dev/sda and alerts when its greater than the threshold that's set (90% default)
# Setting to change:
# SPACE_THRESHOLD: Set this to what percentage it should alert above.

SPACE_THRESHOLD="90"

SPACE=$(df -m / | grep sda | awk '{print $5}')
SPACE=$(sed 's|%||' <<< $SPACE)
echo Disk space is $SPACE% full.

if [ $SPACE -ge $SPACE_THRESHOLD ]; then
  /root/OT-Settings/data/send.sh "Disk space is $SPACE% full."
fi