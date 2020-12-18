---
layout: post
title: Enable Nvidia or Intel GPUs command line for display in Ubuntu/Linux Mint
date: 19-12-2020 03:06:07 +05:30
tags: [nvidia, sysadmin]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

Do you want to set the preferred GPU if `nvidia x server setting` is not displayed
in the tray icon. Let's go command line.

```c
$ sudo prime-select status
Usage: /usr/bin/prime-select nvidia|intel|query
$ sudo prime-select query
nvidia
$ sudo prime-select nvidia
Info: the nvidia profile is already set
```
Of course, mine is already set to nvidia!
Reboot to see the changes.

Peace!
