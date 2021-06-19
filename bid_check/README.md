__bid_check.sh__

This script checks that the docker container "otnode" is running. If this isn't
running then the node is down.

If it isn't running then the script sends a telegram message.

This script uses the config.sh file in /root/OT-Nodewatch. If this is already set for another script in
OT-NodeWatch then you're good to go.

To schedule this job in the servers Cron:

1. Log-in as root
2. crontab -e
3. Press "1" (if asked) to select nano as the editor
4. On a new line paste the following:

0 * * * * /root/OT-NodeWatch/bid_check/bid_check.sh

5. ctrl+s
6. ctrl+x
