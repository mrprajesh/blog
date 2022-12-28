---
layout: post
title: Understanding CUDA packages installed using pip -- errors & fix
date: 28-12-2022 14:25:34 +05:30
tags: [python,cuda,pip,cupy,numba,numpy]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---
After we install newer CUDA toolkit some python code written using numpy+cupy+numba showed the below error on running.
Yes, even after setting the newer cuda home `export CUDA_HOME=/usr/local/cuda-11.5`.

```c
Traceback (most recent call last):
  File "ga-vrp-gpu.py", line 684, in <module>
    calc_cost_gpu[blocks, threads_per_block](data_d, popsize, vrp_capacity, cost_table_d)
  File "/home/rajesh/.local/lib/python3.6/site-packages/numba/cuda/compiler.py", line 804, in __call__
    kernel = self.specialize(*args)
  File "/home/rajesh/.local/lib/python3.6/site-packages/numba/cuda/compiler.py", line 815, in specialize
    kernel = self.compile(argtypes)
  File "/home/rajesh/.local/lib/python3.6/site-packages/numba/cuda/compiler.py", line 834, in compile
    kernel.bind()
  File "/home/rajesh/.local/lib/python3.6/site-packages/numba/cuda/compiler.py", line 548, in bind
    self._func.get()
  File "/home/rajesh/.local/lib/python3.6/site-packages/numba/cuda/compiler.py", line 426, in get
    ptx = self.ptx.get()
  File "/home/rajesh/.local/lib/python3.6/site-packages/numba/cuda/compiler.py", line 397, in get
    **self._extra_options)
  File "/home/rajesh/.local/lib/python3.6/site-packages/numba/cuda/cudadrv/nvvm.py", line 496, in llvm_to_ptx
    ptx = cu.compile(**opts)
  File "/home/rajesh/.local/lib/python3.6/site-packages/numba/cuda/cudadrv/nvvm.py", line 233, in compile
    self._try_error(err, 'Failed to compile\n')
  File "/home/rajesh/.local/lib/python3.6/site-packages/numba/cuda/cudadrv/nvvm.py", line 251, in _try_error
    self.driver.check_error(err, "%s\n%s" % (msg, self.get_log()))
  File "/home/rajesh/.local/lib/python3.6/site-packages/numba/cuda/cudadrv/nvvm.py", line 141, in check_error
    raise exc
numba.cuda.cudadrv.error.NvvmError: Failed to compile

<unnamed> (60, 22): parse expected comma after load's type
NVVM_ERROR_COMPILATION

```

### Steps to Resolve.

1. Uninstall dependencies `pip3 uninstall cupy numba numpy`
1. Set newer environment `export CUDA_HOME=/usr/local/cuda-11.5`
1. Install again. `pip3 install cupy numba numpy`
1. Make sure to export `CUDA_HOME`  or in `.bashrc` before running `python3 gpu-program.py`


## Office use

### Collect env details

Took this from pytorch git repo.

```c
# For security purposes, please check the contents of collect_env.py before running it.

wget https://raw.githubusercontent.com/pytorch/pytorch/master/torch/utils/collect_env.py 
python3 collect_env.py
```

### My env details.
On my local machine.

```c
Collecting environment information...
PyTorch version: 1.13.0+cu117
Is debug build: False
CUDA used to build PyTorch: 11.7
ROCM used to build PyTorch: N/A

OS: Linux Mint 20.3 (x86_64)
GCC version: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0
Clang version: Could not collect
CMake version: version 3.16.3
Libc version: glibc-2.31

Python version: 3.8.10 (default, Jun 22 2022, 20:18:18)  [GCC 9.4.0] (64-bit runtime)
Python platform: Linux-5.15.0-41-generic-x86_64-with-glibc2.29
Is CUDA available: True
CUDA runtime version: 11.7.64
CUDA_MODULE_LOADING set to: LAZY
GPU models and configuration: GPU 0: NVIDIA GeForce RTX 3060 Laptop GPU
Nvidia driver version: 515.48.07
cuDNN version: Could not collect
HIP runtime version: N/A
MIOpen runtime version: N/A
Is XNNPACK available: True

Versions of relevant libraries:
[pip3] numpy==1.23.5
[pip3] torch==1.13.0
[pip3] torchaudio==0.13.0
[pip3] torchvision==0.14.0
[conda] No relevant packages
```
