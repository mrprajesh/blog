---
layout: post
title: debug cuda sudo
date: 19-03-2024 20:31:18 +05:30
tags: [cuda, debug, compute]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

```c
Launched process: ncu (pid: 112990)
/usr/local/cuda-12.2/nsight-compute-2023.2.2/target/linux-desktop-glibc_2_11_3-x64/ncu --config-file off --export /home/rajesh/learn/saxpy/a.cu.profile --force-overwrite --set full /home/rajesh/learn/saxpy/axplusy.out
Launch succeeded.
Profiling...
==PROF== Connected to process 113001 (/home/rajesh/learn/saxpy/axplusy.out)

==ERROR== ERR_NVGPUCTRPERM - The user does not have permission to access NVIDIA GPU Performance Counters on the target device 0. For instructions on enabling permissions and to get more information see https://developer.nvidia.com/ERR_NVGPUCTRPERM

==PROF== Disconnected from process 113001

==WARNING== No kernels were profiled.

==WARNING== Profiling kernels launched by child processes requires the --target-processes all option.

Process terminated.
```
