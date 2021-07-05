__bid_check.sh__

## There is a version for both Docker and Dockerless installations!
---

## __Docker:__
This script checks that the docker logs show the node is bidding by looking for the word "Accepting". If it doesn't find instances in the time set (1 hour default) it will message in Telegram.

It will also message when a job is awarded.

This script uses the config.sh file in /root/OT-Nodewatch. If this is already set for another script in
OT-NodeWatch then you're good to go.

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

ctrl+s  
ctrl+x

---


This script checks that the journalctl logs show the node is bidding by looking for the word "Accepting". If it doesn't find instances in the time set (1 hour default) it will message in Telegram.

It will also message when a job is awarded.

This script uses the config.sh file in /root/OT-Nodewatch. If this is already set for another script in
OT-NodeWatch then you're good to go.

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

ctrl+s  
ctrl+x