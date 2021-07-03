---
layout: post
title: Install/build Gunrock on CentOS
date: 03-07-2021 19:44:23 +05:30
tags: [cuda,gunrock,install]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

This post is in continuation of with my earlier  [blog post](https://mrprajesh.blogspot.com/2019/12/building-gunrock-on-redhatcentos.html).
The recent version (v1.2) of gunrock requires `std=c++14` for building. We have modified some of the steps there. Let's build `SSSP`.
Do check out the [5 minute-video](#short-5-min-video) at the end.

**Step 1: Setting up env**
```c
scl enable devtoolset-8 bash

CUDA_BIN_PATH=/usr/local/cuda-10.2 # edit accordingly.

export CUDA_BIN_PATH
```
*If you do not have devtoolset-8*: Root user to run yum install devtoolset-8

**Step 2: cmake 3.10+ required**
```c
~/install/cmake-3.16.1-Linux-x86_64/bin/cmake --version

cmake version 3.16.1
```
*If you do not have*: Download cmake binary of cmake-x.xx.x-linux-x86_64.tar.gz from [official site](https://cmake.org/download/) and extract locally.

**Step 3: Downloading**
```c
git clone --recursive https://github.com/gunrock/gunrock/

cd gunrock
```
**Step 4: Building**

```c
mkdir build

cd build

~/install/cmake-3.16.1-Linux-x86_64/bin/cmake -DGUNROCK_BUILD_APPLICATIONS=OFF -DGUNROCK_APP_SSSP=ON ..

make -j8 #edit to suit your config
```
**Step 5: Running**

```c
./bin/sssp market ../dataset/small/test_mst.mtx
```

### Short 5 Min video
<script id="asciicast-423671" src="https://asciinema.org/a/423671.js" async></script>
