# NodeWatch
A collection of scripts for OriginTrail Nodes.

Most of the scripts notify thru Telegram anytime an issue arises. For instance if bid_check doesn't see the node bid on a job within 15 minutes it will send a Telegram message.

Includes:

__bid_check__:
- Checks the logs for "Accepting" which indicates a bid. Checks every 15 minutes by default (changable).  

__docker_check__:
- Checks that the "otnode" docker container is running every 5 minutes by default (changable).  
- Checks if the node has updated  

---

__Installation:__

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
