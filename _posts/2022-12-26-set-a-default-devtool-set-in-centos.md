---
layout: post
title: How to set a default devtool set in CentOS.
date: 26-12-2022 14:08:44 +05:30
tags: [cpp, linux]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---


We used to use this command to enable a particular `gcc` or `devtoolset` 

```c
scl enable devtoolset-9 bash
```
Unfortunately, we can NOT put this into our `.bashrc` as it would trigger a forkbomb (infinite looping of sourcing bash).

> It turns out a slightly modified command than the original produces intended effect avoiding forkbomb!


```c
source scl_source enable devtoolset-9

```

Let's append it into `.bashrc`.


## Reference
 - [https://unix.stackexchange.com/a/195219/484734](https://unix.stackexchange.com/a/195219/484734)
