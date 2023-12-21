---
layout: post
title: How to install cuda on ubuntu 22.04 or Linux Mint 22.2
date: 21-12-2023 17:40:12 +05:30
tags: [cuda, ubuntu, linuxmint]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

A fresh install of the OS.

1. Find the CUDA driver version required for your GPU. I saw 535 from my (3060 RTX)[https://www.nvidia.com/download/index.aspx]
2. Find the CUDA version that has that driver. I found 12.2 which matched 535 driver version `xx.x.x_535.xx.xx_linux`
3. In grub press e and type `nomodeset` before `quite splash` //unsure
4. ALT+F1. Login to tty
5. `sudo service lightdm stop`
6. `wget https://developer.download.nvidia.com/compute/cuda/12.2.2/local_installers/cuda_12.2.2_535.104.05_linux.run`
7. `sudo sh cuda_12.2.2_535.104.05_linux.run `
	- Accept.
	- Tick Driver, Toolkit, Demo
	- INSTALL
8. Unpon success. reboot.
9. Append in `~/.bashrc`
```c
export PATH=/usr/local/cuda-12.2/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-12.2/lib64\
                         ${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
```


nvidia-smi
```c
$ nvidia-smi 
Thu Dec 21 17:51:50 2023       
+---------------------------------------------------------------------------------------+
| NVIDIA-SMI 535.104.05             Driver Version: 535.104.05   CUDA Version: 12.2     |
|-----------------------------------------+----------------------+----------------------+
| GPU  Name                 Persistence-M | Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp   Perf          Pwr:Usage/Cap |         Memory-Usage | GPU-Util  Compute M. |
|                                         |                      |               MIG M. |
|=========================================+======================+======================|
|   0  NVIDIA GeForce RTX 3060 ...    Off | 00000000:01:00.0  On |                  N/A |
| N/A   55C    P8              16W / 115W |     50MiB /  6144MiB |      7%      Default |
|                                         |                      |                  N/A |
+-----------------------------------------+----------------------+----------------------+
                                                                                         
+---------------------------------------------------------------------------------------+
| Processes:                                                                            |
|  GPU   GI   CI        PID   Type   Process name                            GPU Memory |
|        ID   ID                                                             Usage      |
|=======================================================================================|
|    0   N/A  N/A      1143      G   /usr/lib/xorg/Xorg                           45MiB |
+---------------------------------------------------------------------------------------+

$ git clone https://github.com/NVIDIA/cuda-samples.git
$ cd cuda-samples/Samples/1_Utilities/deviceQuery
$ make
$ ./deviceQuery 
./deviceQuery Starting...

 CUDA Device Query (Runtime API) version (CUDART static linking)

Detected 1 CUDA Capable device(s)

Device 0: "NVIDIA GeForce RTX 3060 Laptop GPU"
  CUDA Driver Version / Runtime Version          12.2 / 12.2
  CUDA Capability Major/Minor version number:    8.6
  Total amount of global memory:                 5938 MBytes (6226378752 bytes)
  (030) Multiprocessors, (128) CUDA Cores/MP:    3840 CUDA Cores
  GPU Max Clock rate:                            1702 MHz (1.70 GHz)
  Memory Clock rate:                             7001 Mhz
  Memory Bus Width:                              192-bit
  L2 Cache Size:                                 3145728 bytes
  Maximum Texture Dimension Size (x,y,z)         1D=(131072), 2D=(131072, 65536), 3D=(16384, 16384, 16384)
  Maximum Layered 1D Texture Size, (num) layers  1D=(32768), 2048 layers
  Maximum Layered 2D Texture Size, (num) layers  2D=(32768, 32768), 2048 layers
  Total amount of constant memory:               65536 bytes
  Total amount of shared memory per block:       49152 bytes
  Total shared memory per multiprocessor:        102400 bytes
  Total number of registers available per block: 65536
  Warp size:                                     32
  Maximum number of threads per multiprocessor:  1536
  Maximum number of threads per block:           1024
  Max dimension size of a thread block (x,y,z): (1024, 1024, 64)
  Max dimension size of a grid size    (x,y,z): (2147483647, 65535, 65535)
  Maximum memory pitch:                          2147483647 bytes
  Texture alignment:                             512 bytes
  Concurrent copy and kernel execution:          Yes with 2 copy engine(s)
  Run time limit on kernels:                     Yes
  Integrated GPU sharing Host Memory:            No
  Support host page-locked memory mapping:       Yes
  Alignment requirement for Surfaces:            Yes
  Device has ECC support:                        Disabled
  Device supports Unified Addressing (UVA):      Yes
  Device supports Managed Memory:                Yes
  Device supports Compute Preemption:            Yes
  Supports Cooperative Kernel Launch:            Yes
  Supports MultiDevice Co-op Kernel Launch:      Yes
  Device PCI Domain ID / Bus ID / location ID:   0 / 1 / 0
  Compute Mode:
     < Default (multiple host threads can use ::cudaSetDevice() with device simultaneously) >

deviceQuery, CUDA Driver = CUDART, CUDA Driver Version = 12.2, CUDA Runtime Version = 12.2, NumDevs = 1
Result = PASS


```

```c

cat a.cu
#include <cuda.h>
#include <stdio.h>
__global__ void k(){
	printf("hello %u!\n", threadIdx.x);
}
int main(void){
	k<<<2,32>>>();
	cudaDeviceSynchronize();
	return 0;
}
nvcc a.cu && ./a.out
```
