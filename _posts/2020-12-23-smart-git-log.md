---
layout: post
title: Do you want a smart "git log"
date: 23-12-2020 14:13:35 +05:30
tags: [git, coding]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

Many at times `git log` is more difficult to read and scroll. Here is a
smart solution for it. Do you want some thing like below?

![image NOT lOaDeD](images/rajz-git-log.png)

### To setup

```c
$ git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
```
This is just git pretty format and `lg` alias for a bigger `cmd`.


### Ref

For more infor [see here.](https://coderwall.com/p/euwpig/a-better-git-log)
