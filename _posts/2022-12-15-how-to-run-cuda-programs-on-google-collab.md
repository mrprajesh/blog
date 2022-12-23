---
layout: post
title: How to run CUDA programs on Google Collab
date: 15-12-2022 01:22:06 +05:30
tags: [cuda,google,collab]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

[Click this Collab](https://colab.research.google.com/drive/10bGP2-M3Bh2ccgiwXh9Nygb--vchD-wh?usp=sharing) to try it out! You may need to signing using gmail account.

1. Visit [Google Collab](https://colab.research.google.com/)
2. Choose run time as GPU. On Menubar, Runtime > Change runtime > select GPU as accelerator & Save.
3. Connect if it did not connect automatically. You can see the status right top. Tick mark + RAM+DISK.
4. Install+Load the plugin by running the following. 

```c
!pip install git+https://github.com/andreinechaev/nvcc4jupyter.git
%load_ext nvcc_plugin

```
5. Write a CUDA Program and click run.

```c
%%cu
#include <stdio.h>
#include <cuda.h>
__global__ void kernel(){
  printf("Hi, I am Thread %d\n", threadIdx.x);
}
int main(){
  kernel<<<1,32>>>();
  cudaDeviceSynchronize();
  return 0;
}
```
6. You see the Reference section below for an alternate way to run CUDA!

### Office use.

Last two steps should produce output something like this.
```c
!pip install git+https://github.com/andreinechaev/nvcc4jupyter.git
%load_ext nvcc_plugin

Looking in indexes: https://pypi.org/simple, https://us-python.pkg.dev/colab-wheels/public/simple/
Collecting git+https://github.com/andreinechaev/nvcc4jupyter.git
  Cloning https://github.com/andreinechaev/nvcc4jupyter.git to /tmp/pip-req-build-s5n0gpv5
  Running command git clone -q https://github.com/andreinechaev/nvcc4jupyter.git /tmp/pip-req-build-s5n0gpv5
Building wheels for collected packages: NVCCPlugin
  Building wheel for NVCCPlugin (setup.py) ... done
  Created wheel for NVCCPlugin: filename=NVCCPlugin-0.0.2-py3-none-any.whl size=4304 sha256=9c3e8f18056b715a0a495cb582277bbfb1ec08efc8eb8b07df4e300cbd79c1e5
  Stored in directory: /tmp/pip-ephem-wheel-cache-wn6sdoxp/wheels/f3/08/cc/e2b5b0e1c92df07dbb50a6f024a68ce090f5e7b2316b41756d
Successfully built NVCCPlugin
Installing collected packages: NVCCPlugin
Successfully installed NVCCPlugin-0.0.2
created output directory at /content/src
Out bin /content/result.out

%%cu
#include <stdio.h>
#include <cuda.h>
__global__ void kernel(){
  printf("Hi, I am Thread %d\n", threadIdx.x);
}
int main(){
  kernel<<<1,32>>>();
  cudaDeviceSynchronize();
  return 0;
}

Hi, I am Thread 0
Hi, I am Thread 1
Hi, I am Thread 2
Hi, I am Thread 3
Hi, I am Thread 4
Hi, I am Thread 5
Hi, I am Thread 6
Hi, I am Thread 7
Hi, I am Thread 8
Hi, I am Thread 9
Hi, I am Thread 10
Hi, I am Thread 11
Hi, I am Thread 12
Hi, I am Thread 13
Hi, I am Thread 14
Hi, I am Thread 15
Hi, I am Thread 16
Hi, I am Thread 17
Hi, I am Thread 18
Hi, I am Thread 19
Hi, I am Thread 20
Hi, I am Thread 21
Hi, I am Thread 22
Hi, I am Thread 23
Hi, I am Thread 24
Hi, I am Thread 25
Hi, I am Thread 26
Hi, I am Thread 27
Hi, I am Thread 28
Hi, I am Thread 29
Hi, I am Thread 30
Hi, I am Thread 31


```

### Reference 
- My [video](url) on YouTube.
- My [Google Collab page](https://colab.research.google.com/drive/1xv2sZbgOO-HlyjL4Mq3Lkf3D0kj-ARCy?usp=sharing) which also shows an alternate way to compile and run manually without the plugin. 
