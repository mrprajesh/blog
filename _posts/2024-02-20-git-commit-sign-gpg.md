---
layout: post
title: Git commit signature 
date: 20-02-2024 12:38:13 +05:30
tags: [git, gpg]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

In case you need sign your commit - a verified signature on GitHub commit history. Here it is. 
I have already added my GPG key to GitHub.

```c

# Check GPU key
$   gpg --list-secret-keys --keyid-format=long
/home/rajesh/.gnupg/pubring.kbx
-------------------------------
sec   rsa2048/DD95F119EA64BABE 2011-02-11 [SCA]
      79B36A390B6A4BBFA103483BDD95F119EA64BABE

# Tell Git about your signing key
$  git config --global user.signingkey DD95F119EA64BABE

# Instruct to sign every commit
$  git config --global commit.gpgsign true

# Add to startup of terminal
$  [ -f ~/.bashrc ] && echo -e '\nexport GPG_TTY=$(tty)' >> ~/.bashrc


```
### Reference
1. [https://docs.github.com/en/authentication/managing-commit-signature-verification/telling-git-about-your-signing-key
](https://docs.github.com/en/authentication/managing-commit-signature-verification/telling-git-about-your-signing-key
)
