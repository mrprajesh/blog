---
layout: post
title: Building GaloisGPU on CentOS
date: 01-09-2021 10:45:17 +05:30
tags: [install,Galois,GaloisGPU,LonestarGPU]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---
## [WIP] Building GaloisGPU/LonestarGPU on Linux

- Load gcc < 8
```c
module unload gcc920
module load gcc640
```

- Get the v4 and its prerequsites mgpu and cub.

```c
git clone -b release-4.0 https://github.com/IntelligentSoftwareSystems/GaloisGPU
```

Follow below steps

```c
cd GaloisGPU/rt/include
wget https://github.com/NVlabs/cub/archive/refs/tags/v1.3.2.zip #I tried v1.3.1 it is not working. But this seems to.
git clone -b branch_1.1 https://github.com/moderngpu/moderngpu.git #I tried the one in release it is not working. But this seems to.
unzip v1.3.2.zip

## rm old line and link both
ls -lrt #these are to be rm'ed. You should see them blinking
...
  mgpu -> /h2/sreepai/pd/gunrock/externals/moderngpu
  cub -> /h2/sreepai/pd/cub-1.3.1/cub/
...

rm mgpu
rm cub
ln -s cub-1.3.2/cub/ cub      #slash is imp
ln -s moderngpu mgpu          #no slash is imp
ls -lrt #verify if all fine
  lrwxrwxrwx  1 cs16d003 rupeshgrp      14 Sep  1 10:51 cub -> cub-1.3.2/cub/
  lrwxrwxrwx  1 cs16d003 rupeshgrp      18 Sep  1 10:53 mgpu -> moderngpu
cd ../../ #fall back to Galois's Root
```



## Let's make
```c
make inputs #wait till 2GB downloads and 4GB disk

```

- Before we make sssp. We have few files to had older (or arch specific) compilation flags for nvcc

### File common.mk
- cat `common.mk`  #at line 6, Modify the below line
- `CUB_DIR   := $(TOPLEVEL)/cub-1.2.0` #incorrect path
- to
- `CUB_DIR   := $(TOPLEVEL)/rt/include/cub`
- EXTRA := $(FLAGS) $(INCLUDES) $(LINKS) `-Wno-deprecated-declarations`  #Line14 suffix added

### File arch.mk
- cat `arch.mk`
CUDA_ARCH := \
	-gencode arch=compute_35,code=sm_35 \
	-gencode arch=compute_37,code=sm_37 \
	-gencode arch=compute_50,code=sm_50 \
	-gencode arch=compute_52,code=sm_52 \
	-gencode arch=compute_60,code=sm_60 \
	-gencode arch=compute_61,code=sm_61 \
	-gencode arch=compute_61,code=compute_61 # AQUA has V100 which has a cuda capability version 7.0. What should we change this to?

change to

CUDA_ARCH := \
	-gencode arch=compute_60,code=sm_70 \
	-gencode arch=compute_70,code=compute_70


```c

make #no threads please.

#we need libggrt.a file the be generated. Although it ended in errors looks like it is generated.
ls -lrt rt/lib/
  libggrt.a
cd apps/sssp
make


./sssp
usage: ./sssp [-q] [-g gpunum] [-o output-file] [-l] [-d delta] [-s startNode] graph-file
 -l: enable thread block load balancer (by default false)

cd apps/pr #Doing the same for PR and TC. What about BC?
make
cd apps/triangle
make

```
YAY!

Below are the error path that I had to come througth.

## Errors 1
```c
1 catastrophic error detected in the compilation of "/tmp/tmpxft_0000f9eb_00000000-4_main.cpp4.ii".
Compilation aborted.
nvcc error   : 'cudafe++' died due to signal 6
nvcc error   : 'cudafe++' core dumped
make[1]: *** [pta] Error 134
make[1]: Leaving directory `/tmp/GaloisGPU/apps/pta'


```

### Errors 2
```c
make[1]: Entering directory `/tmp/GaloisGPU/apps/bh'
nvcc -O3 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_70,code=compute_70 -w -I ../../include -I ../../rt/include/cub  -Wno-deprecated-declarations   -o bh main.cu
ptxas /tmp/tmpxft_00004d84_00000000-5_main.ptx, line 2633; error   : Instruction 'vote' without '.sync' is not supported on .target sm_70 and higher from PTX ISA version 6.4
ptxas fatal   : Ptx assembly aborted due to errors
make[1]: *** [bh] Error 255
make[1]: Leaving directory `/tmp/GaloisGPU/apps/bh'
make: *** [bh] Error 2

```
