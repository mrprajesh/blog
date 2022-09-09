---
layout: post
title: build moderngpu
date: 31-03-2022 11:45:52 +05:30
tags: [gpu, moderngpu]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

I have
- Mint/Ubuntu 18.04 running GCC 7.4, CUDA 10.0 and Driver 410.73
- cmake-3.22.3 binary.
- GeForce 840M with Compute Capability (CC) 5.0

I could build it but not run it. Because
[CUDA_ARCHITECTURES](https://github.com/moderngpu/moderngpu/blob/master/CMakeLists.txt#L53)
is set higher. Let's change it to `50`

```c
git clone https://github.com/moderngpu/moderngpu.git
cd moderngpu
mkdir build && cd build
~/install/cmake-3.22.3-linux-x86_64/bin/cmake ..
make
./bin/test_segreduce
```

On P100.
- Not working with cmake 3.23
- Just use 3.19
- `scl enable devtoolset-6 bash`
- and it should work.




