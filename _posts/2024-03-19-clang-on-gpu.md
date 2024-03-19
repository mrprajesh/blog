---
layout: post
title: CUDA clang running on GPU
date: 19-03-2024 16:33:36 +05:30
tags: [cuda, clang]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

1. After gaining a lot of insight from the talk [CppCon 2016: “Bringing Clang and C++ to GPUs: An Open-Source, CUDA-Compatible GPU C++ Compiler"]
decided to try clang running on gpu code (https://youtu.be/KHa-OSrZPGo?si=852XDhqzVIsLBqme) [https://llvm.org/docs/CompileCudaWithLLVM.html](https://llvm.org/docs/CompileCudaWithLLVM.html)

```c

clang 14 ## did not work with Cuda 12.2 nor 11.8

clang-15 ## NOT WORKING // sudo apt install clang-15 

clang-17 ## OK GOOD. https://ubuntuhandbook.org/index.php/2023/09/how-to-install-clang-17-or-16-in-ubuntu-22-04-20-04/

## STIL did not work? Nope! It worked
## native
clang++-17 axpy.cu -o axpy.out --cuda-gpu-arch=sm_86 -L/usr/local/cuda-12.2/lib64 -lcudart_static -ldl -lrt -pthread 
## and from HPC tool kit also. Ignore the warining.
clang++-17 axpy.cu -o axpy.out --cuda-gpu-arch=sm_86 -L/opt/nvidia/hpc_sdk/Linux_x86_64/24.3/cuda/11.8/lib64 -lcudart_static -ldl -lrt -pthread

./axpy.out
y[0] = 2
y[1] = 4
y[2] = 6
y[3] = 8

```


## Errors before fixing it!

```
/usr/lib/llvm-15/lib/clang/15.0.7/include/__clang_cuda_texture_intrinsics.h:696:13: error: no template named 'texture'
            texture<__DataT, __TexT, cudaReadModeNormalizedFloat> __handle,
            ^
/usr/lib/llvm-15/lib/clang/15.0.7/include/__clang_cuda_texture_intrinsics.h:709:13: error: no template named 'texture'
            texture<__DataT, __TexT, cudaReadModeElementType> __handle,
            ^
2 errors generated when compiling for sm_86.


```

