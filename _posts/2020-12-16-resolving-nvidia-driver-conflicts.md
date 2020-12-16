---
layout: post
title: Resolving nvidia/cuda driver conflicts
date: 16-12-2020 14:17:15 +05:30
tags: [gpu, nvidia, sysadmin]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

Recently on my advisor's server machine, some automatic updates has messed
up with the installed drivers. So, this resulted in the following:

```
CUDA error 30: unknown error.
```

Even the device query was erring.

```
cudaGetDeviceCount returned 30
-> unknown error
Result = FAIL
```

However, `nvidia-smi` was showing
the GPUs connected.


```shell
rajesh@rn-gpu-p100 ~]$ dkms status
nvidia, 396.44, 3.10.0-862.3.2.el7.x86_64, x86_64: installed (WARNING! Diff between built and installed module!) (WARNING! Diff between built and installed module!) (WARNING! Diff between built and installed module!)
nvidia, 440.31, 3.10.0-862.3.2.el7.x86_64, x86_64: built
# dkms remove -m nvidia -v 396.44 --all
# dkms remove -m nvidia -v 440.31 --all
# dkms install -m nvidia -v 440.31

# reboot

# dkms status
nvidia, 440.31, 3.10.0-862.3.2.el7.x86_64, x86_64: installed
```

That resolved the cuda error 30. Yay!
