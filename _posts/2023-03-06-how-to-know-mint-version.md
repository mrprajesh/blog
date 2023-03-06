---
layout: post
title: How to find Linux OS version details using terminal.
date: 06-03-2023 13:49:59 +05:30
tags: [linux,ubuntu,mint]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

There are multiple GUI-ways to find the Linux OS versions. Here are some the might come handy

```c
# Kernel Information.

$ uname -a
Linux g15warrior 5.15.0-41-generic #44~20.04.1-Ubuntu SMP Fri Jun 24 13:27:29 UTC 2022 x86_64 x86_64 x86_64 GNU/Linux

$ lsb_release -a
No LSB modules are available.
Distributor ID:	Linuxmint
Description:	Linux Mint 20.3
Release:	20.3
Codename:	una

// $ cat /etc/*release
DISTRIB_ID=LinuxMint
DISTRIB_RELEASE=20.3
DISTRIB_CODENAME=una
DISTRIB_DESCRIPTION="Linux Mint 20.3 Una"
NAME="Linux Mint"
VERSION="20.3 (Una)"
ID=linuxmint
ID_LIKE=ubuntu
PRETTY_NAME="Linux Mint 20.3"
VERSION_ID="20.3"
HOME_URL="https://www.linuxmint.com/"
SUPPORT_URL="https://forums.linuxmint.com/"
BUG_REPORT_URL="http://linuxmint-troubleshooting-guide.readthedocs.io/en/latest/"
PRIVACY_POLICY_URL="https://www.linuxmint.com/"
VERSION_CODENAME=una
UBUNTU_CODENAME=focal


// $ cat /etc/*/*release
...
  
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=20.04
DISTRIB_CODENAME=focal
DISTRIB_DESCRIPTION="Ubuntu Focal Fossa"


```
