---
layout: post
title: Audible alert for battery low and high
date: 09-05-2022 19:02:06 +05:30
tags: [linux, shell]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

As both prolonged usage with AC power on the laptop and critically low battery degreades battery life;
I decided to write a script that give an audio alert to disconnec/connect the charger.
I have scheduled this script on `cron`. Now, both my life and battery life is better.

**alert-on-full-battery.sh**
```c
#!/bin/bash
## ALL STATS OF BATTERY
#~ find /sys/class/power_supply/BAT0/ -type f | xargs -tn1 cat

## BATTERY LOW LEVE ALERT
LOW_LEVEL=15

## DEFAULT ALERT ON 95
## USER CAN SPECIFY 1st ARG AS custom  threshold level

THRESHOLD=95

if [ $# -ge 1 ]
then
    if [ $1 -ge 0 -a  $1 -lt 100 ] ## -a means and condition
  then
    THRESHOLD=$1
  fi
fi


# post 4.2 keernel (see using uaname -a)  recommended usage to get batter percent /sys/class/power_supply/BAT0
# ll /sys/class/power_supply/BAT*
# cat /sys/class/power_supply/BAT0/capacity #in my machine  somtime it might in BAT1 !? :|

## GET CURRENT BATTERY STATE
CURRENT_LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)

printf "$(date +"%d-%b-%Y %T (%Z)"), $(cat /sys/class/power_supply/BAT0/status), current battery level: $CURRENT_LEVEL, threshold: $THRESHOLD"


## if current battery level is more than threahhold
if [ $CURRENT_LEVEL -ge $THRESHOLD ]
then
  #~ LOUD
  #~ paplay /usr/share/sounds/LinuxMint/stereo/phone-incoming-call.ogg

  #~ MILD
  paplay /usr/share/sounds/freedesktop/stereo/complete.oga
  echo "save power" | espeak
  printf ", HIGH ALERT"
fi


if [ $CURRENT_LEVEL -lt $LOW_LEVEL ]
then
  paplay /usr/share/sounds/freedesktop/stereo/complete.oga
  echo "connect charger" | espeak
  printf ", LOW ALERT"
fi

printf "\n"

## CRON: crontab -e
#~ XDG_RUNTIME_DIR=/run/user/1000
#~ */5 * * * * /home/rajz/auto-scripts/alert-on-full-battery.sh 95 >> /tmp/alert-on-full-battery.log

```


### schedule on cron

```c
crontab -e

## append the below line towards the end and save. It is set to run every 5 mins.
XDG_RUNTIME_DIR=/run/user/1000
*/5 * * * * /home/rajz/auto-scripts/alert-on-full-battery.sh 95 >> /tmp/alert-on-full-battery.log
```

The above self explanatory.
- It alerts when there is low batter.
- It alerts when the battery is almost full. You can give a custom threshold. Default is 95.
- It also has speaks!
- This must help the bettery life.
