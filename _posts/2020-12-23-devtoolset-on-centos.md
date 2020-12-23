---
layout: post
title: Enable recent gcc version using devtoolset on centOs
date: 23-12-2020 13:37:55 +05:30
tags: [gcc, g++, sysadmin]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

This is a trick we use for using various `gcc` version on the same machine.
The machine my advisor runs on centOs. Everyone has a different
requirement for gcc. So, they have this wonderful option of devtoolset.
Must be installed by `root` user. Assuming that appropriate version is
installed. Lets see how to enable it.

```c
$ g++ --version
g++ (GCC) 4.8.5 20150623 (Red Hat 4.8.5-28)

$ scl enable devtoolset-7 bash

$ g++ --version
g++ (GCC) 7.3.1 20180303 (Red Hat 7.3.1-5)

```

Usually the installation goes here.

```c
$ ll
total 0
dr-xr-xr-x. 3 root root 32 Dec 20  2017 devtoolset-3
dr-xr-xr-x. 3 root root 32 Dec 20  2017 devtoolset-4
dr-xr-xr-x. 3 root root 32 Dec 20  2017 devtoolset-6
dr-xr-xr-x. 3 root root 32 Jun  1  2018 devtoolset-7
dr-xr-xr-x. 3 root root 32 Mar 19  2020 rh-python35
$ pwd
/opt/rh
```

### Ref

For more [info](https://www.softwarecollections.org/en/scls/rhscl/devtoolset-7/).
