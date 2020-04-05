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

### Way 1 (works great!)

- while connecting via ssh add few flags
- `ssh -o ServerAliveInterval=60 <myname>@<myremote-host-or-ip-address>`

### Way 2

- `nano $HOME/.ssh/config`
```c
Host *
    ServerAliveInterval 240
```
- chmod 600 $HOME/.ssh/config

#### Alias ssh - Way 1

- In `~/.bashrc`, towards the end

```c
alias sshlive='ssh -o ServerAliveInterval=60'
```
- Open a new terminal or run `source ~/.bashrc`
- See, list of aliases that are set. Type `alias`
- Next time, when I want ssh we need not remember the long command.
- Just type `sshlive user@hostname`.
- Thanks to `alias`


#### Thanks
Cheers and thanks to [SO!](https://stackoverflow.com/questions/25084288/keep-ssh-session-alive)
