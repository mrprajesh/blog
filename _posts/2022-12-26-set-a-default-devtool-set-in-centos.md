---
layout: post
title: How to set a default devtool set in CentOS.
date: 26-12-2022 14:08:44 +05:30
tags: [cpp,gcc,devtoolset,linux]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

We used to use the below command to enable a particular `gcc` or `devtoolset` as our [earlier post suggested.](https://mrprajesh.co.in/blog//devtoolset-on-centos.html)

```c
scl enable devtoolset-9 bash
```

Unfortunately, we can NOT put this into our `.bashrc` as it would trigger a forkbomb (infinite looping of sourcing bash).

> It turns out a slightly modified command than the original produces intended effect avoiding forkbomb!


```c
source scl_source enable devtoolset-9

```

Let's append it into `.bashrc` and check gcc/g++ version upon login.

```c
g++ --version
g++ (GCC) 9.3.1 20200408 (Red Hat 9.3.1-2)
Copyright (C) 2019 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

```

Assuming you have already installed devtoolset-9, if not, install using the cmds from office use section.


## Reference
 - [https://unix.stackexchange.com/a/195219/484734](https://unix.stackexchange.com/a/195219/484734)
 - [https://developers.redhat.com/products/developertoolset/hello-world](https://developers.redhat.com/products/developertoolset/hello-world)

## Office use.

```c
# Login as root and install the required version. 
su -
yum update #optional step.
yum install devtoolset-9
```
