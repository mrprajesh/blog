---
layout: post
title: How to get verified badge for your commits
date: 09-09-2022 19:24:20 +05:30
tags: [git, verified]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---


### How to get verified badge for your commits


```c
#sign all commits by default
git config --global commit.gpgsign true


# find your gpp key
gpg --list-secret-keys --keyid-format=long
/home/rajesh/.gnupg/pubring.kbx
-------------------------------
sec   rsa2048/DD95F119EA64BABE 2011-02-11 [SCA]
      79B36A390B6A4BBFA103483BDD95F119EA64BABE
uid                 [ultimate] Rajesh Pandian M (This is my True Gmail ID - Rajz) <someone@gmail.com>


#use your key here
git config --global user.signingkey DD95F119EA64BABE


# make available
 [ -f ~/.bashrc ] && echo 'export GPG_TTY=$(tty)' >> ~/.bashrc
 
 ```

You will see `verified` badge as [here](https://github.com/mrprajesh/blog/commits/master).

