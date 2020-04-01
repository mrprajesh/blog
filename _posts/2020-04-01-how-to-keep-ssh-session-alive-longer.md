---
layout: post
title: How to keep ssh session alive longer
date: 01-04-2020 13:40:44 +05:30
tags: [ssh,linux]
description: How to keep ssh session alive longer
summary: How to keep ssh session alive longer
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

- More often `ssh` times out when the user is not using the terminal for a few minutes.
- The remote server disconnects the silent clients; Annoying! :angry:
- Two ways to resolve from client-side on Linux Mint/Ubuntu/Any

### Way 1

- while connecting via ssh add few flags
- `ssh -o ServerAliveInterval=60 <myname>@<myremote-host-or-ip-address>`

### Way 2

- `nano $HOME/.ssh/config`
```c
Host *
    ServerAliveInterval 240
```
- chmod 600 $HOME/.ssh/config


#### Thanks
Cheers and thanks to [SO!](https://stackoverflow.com/questions/25084288/keep-ssh-session-alive)
