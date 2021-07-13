__bid_check.sh__

---


This script checks that the logs show the node is bidding by looking for the word "Accepting". If it doesn't find instances in the time set (1 hour default) it will message in Telegram.

It will also message when a job is awarded.

This script uses the config.sh file in /root/OT-Settings. If this is already set then you're good to go!

To schedule this job in the servers Cron:

Log-in as root
```
crontab -e
```
Press "1" (if asked) to select nano as the editor
On a new line paste the following:

```
0 * * * * /root/OT-NodeWatch/bid_check/bid_check.sh
```
```
ctrl+s
```
```
ctrl+x
```