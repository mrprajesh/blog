---
layout: post
title: How to install+run Gunrock's Loops on P100 GPU using CentOS
date: 26-11-2022 12:32:46 +05:30
tags: [cuda,loops,gunrock,centos,p00]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

## Tested with

- CentOS v7.9.2009 
- CMake v23
- CUDA v11.5
- GCC 9.3

## System setup using P100

```c
$ scl enable devtoolset-9 bash

$ nvcc --version
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2021 NVIDIA Corporation
Built on Thu_Nov_18_09:45:30_PST_2021
Cuda compilation tools, release 11.5, V11.5.119
Build cuda_11.5.r11.5/compiler.30672275_0

$ g++ --version
g++ (GCC) 9.3.1 20200408 (Red Hat 9.3.1-2)
Copyright (C) 2019 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

# CAUTION: you can skip THIS STEP if P100 is your DEFAULT DEVICE 0 GPU
$ export CUDA_VISIBLE_DEVICES=1

$ echo $CUDA_VISIBLE_DEVICES 
1

# you need not run the next 2 steps. But just to show CC+DRIVER version

$ ~/samples/1_Utilities/deviceQuery/deviceQuery 
/home/rajesh/samples/1_Utilities/deviceQuery/deviceQuery Starting...

 CUDA Device Query (Runtime API) version (CUDART static linking)

Detected 1 CUDA Capable device(s)

Device 0: "Tesla P100-PCIE-12GB"
  CUDA Driver Version / Runtime Version          11.5 / 9.1
  CUDA Capability Major/Minor version number:    6.0              <<<==================================================HERE
  Total amount of global memory:                 12198 MBytes (12790923264 bytes)
  (56) Multiprocessors, ( 64) CUDA Cores/MP:     3584 CUDA Cores
  GPU Max Clock rate:                            1329 MHz (1.33 GHz)
  Memory Clock rate:                             715 Mhz
  Memory Bus Width:                              3072-bit
  L2 Cache Size:                                 3145728 bytes
  Maximum Texture Dimension Size (x,y,z)         1D=(131072), 2D=(131072, 65536), 3D=(16384, 16384, 16384)
  Maximum Layered 1D Texture Size, (num) layers  1D=(32768), 2048 layers
  Maximum Layered 2D Texture Size, (num) layers  2D=(32768, 32768), 2048 layers
  Total amount of constant memory:               65536 bytes
  Total amount of shared memory per block:       49152 bytes
  Total number of registers available per block: 65536
  Warp size:                                     32
  Maximum number of threads per multiprocessor:  2048
  Maximum number of threads per block:           1024
  Max dimension size of a thread block (x,y,z): (1024, 1024, 64)
  Max dimension size of a grid size    (x,y,z): (2147483647, 65535, 65535)
  Maximum memory pitch:                          2147483647 bytes
  Texture alignment:                             512 bytes
  Concurrent copy and kernel execution:          Yes with 2 copy engine(s)
  Run time limit on kernels:                     No
  Integrated GPU sharing Host Memory:            No
  Support host page-locked memory mapping:       Yes
  Alignment requirement for Surfaces:            Yes
  Device has ECC support:                        Enabled
  Device supports Unified Addressing (UVA):      Yes
  Device PCI Domain ID / Bus ID / location ID:   0 / 130 / 0
  Compute Mode:
     < Default (multiple host threads can use ::cudaSetDevice() with device simultaneously) >

deviceQuery, CUDA Driver = CUDART, CUDA Driver Version = 11.5, CUDA Runtime Version = 9.1, NumDevs = 1, Device0 = Tesla P100-PCIE-12GB
Result = PASS

$ nvidia-smi 
Sat Nov 26 10:16:26 2022       
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 495.29.05    Driver Version: 495.29.05    CUDA Version: 11.5     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|                               |                      |               MIG M. |
|===============================+======================+======================|
|   0  NVIDIA GeForce ...  On   | 00000000:02:00.0 Off |                  N/A |
| 18%   29C    P8    13W / 250W |     20MiB / 11019MiB |      0%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+
|   1  Tesla P100-PCIE...  On   | 00000000:82:00.0 Off |                    0 |
| N/A   31C    P0    24W / 250W |      0MiB / 12198MiB |      0%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+
                                                                               
+-----------------------------------------------------------------------------+
| Processes:                                                                  |
|  GPU   GI   CI        PID   Type   Process name                  GPU Memory |
|        ID   ID                                                   Usage      |
|=============================================================================|
|    0   N/A  N/A      1670      G   /usr/bin/X                         18MiB |
+-----------------------------------------------------------------------------+

```

## Dowloading loop and run.

```c
$ git clone git@github.com:gunrock/loops.git
$ cd loops
 
#### IN CMakeLists.txt CHANGE THE LINE 72 to this: set(CMAKE_CUDA_ARCHITECTURES 60)
#### i.e to use SM60 CC version THAT we found from our device query. As PER P100 GPU. 

$ vim CMakeLists.txt

$ mkdir build && cd build

$ ~/install/cmake-3.23.0-linux-x86_64/bin/cmake ..       # I HAVE A NEW CMAKE BINARY IN MY HOME. HOPE YOU HAVE IT TOO.

# ... wait
 
$ make loops.spmv.merge_path 

# ... wait

$ bin/loops.spmv.merge_path -m ../datasets/chesapeake/chesapeake.mtx
merge_path_flat,chesapeake,39,39,340,0.020256

```
This sanity should work. Then, do `make $(nproc)` at penultimate step and run specific apps after `wget`-ting all the dataset files.

## Office use -- Using this commit version in main.

```c
$ git lg
*   40a6719 - (HEAD, origin/main, origin/HEAD, main) [skip ci] Merge pull request #24 from neoblizz/dev (20 hours ago) <Muhammad Osama>
|\  
| * 4e99a28 - gitignore ignored the mtx file. (20 hours ago) <neoblizz>
* |   55b5e68 - Merge pull request #23 from neoblizz/dev (4 days ago) <Muhammad Osama>
|\ \  
| |/  
| * f348586 - [skip ci] forgot to mention ipynb. (4 days ago) <neoblizz>
* |   c598aba - Merge pull request #22 from gunrock/dev (4 days ago) <Muhammad Osama>
|\ \  
| * \   651da0c - (origin/dev) Merge pull request #21 from neoblizz/dev (4 days ago) <Muhammad Osama>
| |\ \  


```
