__disk_check.sh__

This script checks the space used on /dev/sda. If it is equal-to or over the value set (default 75%) it will message you in Telegram. Default is to run once a day.

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
0 * * * * /root/OT-NodeWatch/disk_check/disk_check.sh
```
```
ctrl+s
ctrl+x
```