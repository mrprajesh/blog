---
layout: post
title: apt-get error in linux mint
date: 29-03-2020 17:46:41 +05:30
tags: [jekyll]
description:
summary:
comments: false
author: Rajesh Pandian M
---

The last time when I went to my relatives home which had a good internet connection.
I had faced some issues with `apt-get`.

```c
rajz@LordOfWarriors:~$ sudo apt-get update
Err:3 http://security.ubuntu.com/ubuntu bionic-security InRelease
  **Clearsigned file isn't valid, got 'NOSPLIT' (does the network
  require authentication?)**
Err:4 http://mirrors.evowise.com/linuxmint/packages tara InRelease
  **Clearsigned file isn't valid, got 'NOSPLIT' (does the network
  require authentication?)**

<snip>

Reading package lists... Done
N: See apt-secure(8) manpage for repository creation and user
configuration details.
N: Updating from such a repository can't be done securely, and is
therefore disabled by default.
E: The repository 'http://security.ubuntu.com/ubuntu bionic-security
InRelease' is no longer signed.
E: Failed to fetch http://security.ubuntu.com/ubuntu/dists/bionic-security/InRelease
Clearsigned file isn't valid, got 'NOSPLIT' (does the network require authentication?)
N: See apt-secure(8) manpage for repository creation and user configuration details.
N: Updating from such a repository can't be done securely,
and is therefore disabled by default.
E: The repository 'http://mirrors.evowise.com/linuxmint/packages tara InRelease'
is no longer signed.
E: Failed to fetch http://mirrors.evowise.com/linuxmint/packages/dists/tara/InRelease
Clearsigned file isn't valid, got 'NOSPLIT' (does the network require authentication?)

<snip>

```

- I tried a lot changing the servers in sources sofwares.
- But, the solution was simple. The network had a authentication for the internet from ISP.
- When I switched to the other/Mobile network.
- This problem got resolved. :-|





