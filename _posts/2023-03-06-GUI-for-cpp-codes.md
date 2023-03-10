---
layout: post
title: GUI for cpp codes
date: 06-03-2023 14:02:17 +05:30
tags: [cpp, coding]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

```c
sudo apt-key adv --fetch-keys https://repos.codelite.org/CodeLite.asc
sudo apt-add-repository 'deb https://repos.codelite.org/wx3.2.0/ubuntu/ focal universe'
sudo apt-get update

sudo apt-get install libwxbase3.2-0-unofficial \
                libwxbase3.2unofficial-dev \
                libwxgtk3.2-0-unofficial \
                libwxgtk3.2unofficial-dev \
                wx3.2-headers \
                wx-common \
                wx3.2-examples

// Optional!
LDFLAGS=$(pkg-config --libs gtk+-3.0) CXXFLAGS=$(pkg-config --cflags gtk+-3.0) make -j$(nproc)

```
