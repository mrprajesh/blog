---
layout: post
title: change default login shell to bash without root access
date: 03-03-2022 11:05:41 +05:30
tags: [linux, shell, bash, sh]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

Somehow our admin did not make `bash` as a default shell during user creation.
I had to type every time `bash` after login to enable bash like below:

```c
Welcome to Ubuntu 20.04.3 LTS (GNU/Linux 5.13.0-30-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage
$
$
```

It is easy to make bash as default. Run `chsh -s /bin/bash` or do below:

```c
chsh
Password:
Changing the login shell for <usernme>
Enter the new value, or press ENTER for the default
	Login Shell [/bin/sh]: /bin/bash
$
```


Tada! It is done. you can exit and re-login to confirm.
