# OT-NodeWatch
## A collection of scripts to monitor your OriginTrail Nodes

All monitor scripts will notify you through Telegram anytime an issue arises. 

For instance, if bid_check.sh doesn't see your node bid on a job within 1 hour, it will send you a Telegram message.

## This collection includes:

__bid_check:__
- Checks the logs for "Accepting" which indicates a bid. Checks every hour by default (changable).  
- Checks the logs for "ve been chosen" which indicates an awarded job. Checks every hour by default (changable).  

__docker_check:__
- Checks that the "otnode" docker container is running every 5 minutes by default (changable).  
- Checks if the node has updated  

__disk_check:__
- Checks the disk space used every day by default (changable).  

---

## __Manual installation:__

Log into server as root.
```
cd
```
```
git clone https://github.com/calr0x/OT-NodeWatch.git
```
```
nano config.sh
```
Replace the values for both lines with your Telegram token and chat_id.
```
ctrl+s ctrl+x
```
---
## __bid_check:__
Default check is every hour.

```
crontab -e
```
Press '1' (if asked) to select nano as the editor.
```
0 * * * * /root/OT-NodeWatch/bid_check/bid_check.sh
```
```
ctrl+s ctrl+x
```
---
## __docker_check:__
Default check is every 5 minutes.
```
crontab -e
```
Press '1' (if asked) to select nano as the editor.
```
*/5 * * * * /root/OT-NodeWatch/docker_check/docker_check.sh
```
```
ctrl+s ctrl+x
```
---
## __disk_check:__ 
Default check is once a day.
```
crontab -e
```
Press '1' (if asked) to select nano as the editor.
```
0 0 * * * /root/OT-NodeWatch/disk_check/disk_check.sh
```
```
ctrl+s ctrl+x
```
---
## __Dockerless NodeWatch__
```
crontab -e
```
Delete the docker_check.sh line completely in the crontab

Replace the previous bid_check crontab input with the following
```
0 * * * * /root/OT-NodeWatch/bid_check/bid_check-dockerless.sh
```
