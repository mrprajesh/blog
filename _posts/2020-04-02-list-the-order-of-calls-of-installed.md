---
layout: post
title: List the order of calls of installed
date: 02-04-2020 19:45:14 +05:30
tags: [jekyll, coding]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

I had a ruby 2.7 version but system was using 2.5 (an older came by default).
How did I managed to find out  with `which` command.


```c
rajz@LordOfWarriors:~$ ruby -v
ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-linux-gnu]
rajz@LordOfWarriors:~$ which ruby
/usr/bin/ruby
rajz@LordOfWarriors:~$ which -a ruby
/usr/bin/ruby
/home/linuxbrew/.linuxbrew/bin/ruby
rajz@LordOfWarriors:~$ /home/linuxbrew/.linuxbrew/bin/ruby -v
ruby 2.7.0p0 (2019-12-25 revision 647ee6f091) [x86_64-linux]
rajz@LordOfWarriors:~$

```
