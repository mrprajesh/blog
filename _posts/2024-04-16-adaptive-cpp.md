---
layout: post
title: Adaptive cpp (formerly hipSYCL) to run NVIDIA GPUs
date: 16-04-2024 02:38:17 +05:30
tags: [cuda, adaptivecpp, acpp, sycl, hipSYCL]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

Warning. This is a notes for my later reading. Not an clear document! 

### Prereq
1. Assumes default CUDA install location
2. Nvidia GPU 
3. Understand [TARGETS](https://github.com/AdaptiveCpp/AdaptiveCpp/blob/develop/doc/compilation.md#summary-of-supported-compilation-targets) and [LLVM versioning](https://github.com/AdaptiveCpp/AdaptiveCpp/blob/develop/doc/installing.md#advanced-installation), also see doc/install*md compilation.md
4. LLVM installed using [this steps](#llvm)
5. `generic` - creates a binary that can run on all backends -- creates the fastest binaries.
6. > If you use a very recent CUDA version, you might get a warning when compiling with AdaptiveCpp that clang does not support your CUDA version and treats like an older version. This warning can usually safely be ignored.

## Update
- WORKING OPTION: `cuda-nvcxx`	NVIDIA GPUs	Library-only
- TRYING! `cuda.integrated-multipass`	NVIDIA GPUs

```
# GET IT

git clone https://github.com/AdaptiveCpp/AdaptiveCpp adap-cpp
cd AdaptiveCpp
mkdir build install
cd build

cmake -DCMAKE_INSTALL_PREFIX=`pwd`/install .. # default deductions

cmake -DCUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda -DWITH_CUDA_BACKEND=ON -DCMAKE_INSTALL_PREFIX=`pwd`/install .. # explicit cuda. it is picking llvm 14 instead of 17

cmake -DCMAKE_INSTALL_PREFIX=/home/rajesh/temp/adap-cpp/install  -DLLVM_DIR=/usr/lib/llvm-17/cmake  -DCLANG_INCLUDE_PATH=/usr/lib/llvm-17/lib/clang/17/include   ..  # my try llvm 17; mention explicit?
make -j4  install


cmake -DCMAKE_INSTALL_PREFIX=`pwd`/install  -DLLVM_DIR=/home/rajesh/install/llvm15-src-install/lib/cmake  -DCLANG_INCLUDE_PATH=/home/rajesh/install/llvm15-src-install/include   ..
```
### to test 

  ```
cat test.cpp # https://github.com/AdaptiveCpp/AdaptiveCpp/blob/develop/doc/examples.md
# /home/rajesh/temp/adap-cpp/install/bin/acpp test.cpp -o test.out -O3 --acpp-targets=generic

#include <cassert>
#include <iostream>

#include <CL/sycl.hpp>

using data_type = float;

std::vector<data_type> add(cl::sycl::queue& q,
                           const std::vector<data_type>& a,
                           const std::vector<data_type>& b)
{
  std::vector<data_type> c(a.size());

  assert(a.size() == b.size());
  cl::sycl::range<1> work_items{a.size()};

  {
    cl::sycl::buffer<data_type> buff_a(a.data(), a.size());
    cl::sycl::buffer<data_type> buff_b(b.data(), b.size());
    cl::sycl::buffer<data_type> buff_c(c.data(), c.size());

    q.submit([&](cl::sycl::handler& cgh){
      auto access_a = buff_a.get_access<cl::sycl::access::mode::read>(cgh);
      auto access_b = buff_b.get_access<cl::sycl::access::mode::read>(cgh);
      auto access_c = buff_c.get_access<cl::sycl::access::mode::write>(cgh);

      cgh.parallel_for<class vector_add>(work_items,
                                         [=] (cl::sycl::id<1> tid) {
        access_c[tid] = access_a[tid] + access_b[tid];
      });
    });
  }
  return c;
}

int main()
{
  cl::sycl::queue q;
  std::vector<data_type> a = {1.f, 2.f, 3.f, 4.f, 5.f};
  std::vector<data_type> b = {-1.f, 2.f, -3.f, 4.f, -5.f};
  auto result = add(q, a, b);

  std::cout << "Result: " << std::endl;
  for(const auto x: result)
    std::cout << x << std::endl;
}

```
## Post steps
```
ls -lrt myinstall/bin
total 324
-rwxr-xr-x 1 rajesh rajesh 67339 Apr 16 02:25 syclcc-clang
-rwxr-xr-x 1 rajesh rajesh 67339 Apr 16 02:25 syclcc
-rwxr-xr-x 1 rajesh rajesh 67339 Apr 16 02:25 acpp
-rwxr-xr-x 1 rajesh rajesh 71216 Apr 16 02:35 acpp-hcf-tool
-rwxr-xr-x 1 rajesh rajesh 48040 Apr 16 02:35 acpp-info


/acpp-info 
=================Backend information===================
Loaded backend 0: CUDA
  Found device: NVIDIA GeForce RTX 3060 Laptop GPU
Loaded backend 1: OpenCL
  Found device: 12th Gen Intel(R) Core(TM) i7-12700H
Loaded backend 2: OpenMP
  Found device: hipSYCL OpenMP host device
Loaded backend 3: HIP
  (no devices found)
  
  ...
  
  

## WORKING?
 
/home/rajesh/temp/adap-cpp/install/bin/acpp test.cpp -o test.out -O3 --acpp-targets=generic
 rajesh   g15warrior   ~  
 03:43   $   ./test.out 
'+ptx86' is not a recognized feature for this target (ignoring feature)
'+ptx86' is not a recognized feature for this target (ignoring feature)
'+ptx86' is not a recognized feature for this target (ignoring feature)
[AdaptiveCpp Warning] kernel_cache: This application run has resulted in new binaries being JIT-compiled. This indicates that the runtime optimization process has not yet reached peak performance. You may want to run the application again until this warning no longer appears to achieve optimal performance.
Result: 
0
4
0
8
0


## LOOKS LIKE SOMETHING IS WRONG

/home/rajesh/temp/adap-cpp/install/bin/acpp test.cpp -o test.out -O3 --acpp-targets="cuda"
/home/rajesh/temp/adap-cpp/install/bin/acpp test.cpp -o test.out -O3 --acpp-targets="cuda"
/home/rajesh/temp/adap-cpp/install/bin/acpp test.cpp -o test.out -O3 --acpp-targets="cuda:sm_70"
clang: warning: CUDA version is newer than the latest supported version 11.5 [-Wunknown-cuda-version]
In file included from <built-in>:1:
In file included from /usr/lib/llvm-14/lib/clang/14.0.0/include/__clang_cuda_runtime_wrapper.h:365:
/usr/lib/llvm-14/lib/clang/14.0.0/include/__clang_cuda_texture_intrinsics.h:696:13: error: no template named 'texture'
            texture<__DataT, __TexT, cudaReadModeNormalizedFloat> __handle,
            ^
/usr/lib/llvm-14/lib/clang/14.0.0/include/__clang_cuda_texture_intrinsics.h:709:13: error: no template named 'texture'
            texture<__DataT, __TexT, cudaReadModeElementType> __handle,
            ^
2 errors generated when compiling for sm_70.


## Let's try only nvc++
   

# https://github.com/AdaptiveCpp/AdaptiveCpp/blob/b61a18683cb66734b3d6a1d02ab3e3cb6f1d7d8d/.github/workflows/linux.yml#L172C9-L173C8

cmake \
-DNVCXX_COMPILER=/opt/nvidia/hpc_sdk/Linux_x86_64/24.3/compilers/bin/nvc++  \
-DWITH_CUDA_BACKEND=ON -DWITH_CUDA_NVCXX_ONLY=ON \
-DCMAKE_INSTALL_PREFIX=`pwd`/install \
-DCUDA_TOOLKIT_ROOT_DIR=/opt/nvidia/hpc_sdk/Linux_x86_64/24.3/cuda/12.3 ..    
 
home/rajesh/temp/adap-cpp/build-nvcpp/install/bin/acpp test.cpp -o test.out -O3 --acpp-targets="cuda-nvcxx" && ./test.out # great works!

Result: 
0
4
0
8
0
WORKS!!!

# below did not work
/home/rajesh/temp/adap-cpp/build-nvcpp/install/bin/acpp test.cpp -o test.out -O3 --acpp-targets="generic" && ./test.out #Gives same warnings as before!
/home/rajesh/temp/adap-cpp/build-nvcpp/install/bin/acpp test.cpp -o test.out -O3 --acpp-targets="cuda:sm_70" && ./test.out # same error 1

 
## if above fails, check with llvm 17 

https://github.com/AdaptiveCpp/AdaptiveCpp/blob/b61a18683cb66734b3d6a1d02ab3e3cb6f1d7d8d/.github/workflows/linux.yml#L84C179-L84C201 

cmake -DCMAKE_CXX_COMPILER=/usr/bin/clang++-17 -DCLANG_EXECUTABLE_PATH=/usr/bin/clang++-17 -DLLVM_DIR=/usr/lib/llvm-17/cmake -DWITH_CUDA_BACKEND=ON -DWITH_ROCM_BACKEND=ON -DCMAKE_INSTALL_PREFIX=`pwd`/install -DCUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda -DROCM_PATH=/opt/rocm ..
    
./install/bin/acpp test.cpp -o test.out -O3 --acpp-targets="cuda-nvcxx" --acpp-nvcxx=/opt/nvidia/hpc_sdk/Linux_x86_64/24.3/compilers/bin/nvc++
./test.out 
Result: 
0
4
0
8
0
16

WOW! nvc++ is the only way out!?


15 did not work
cmake -DCMAKE_CXX_COMPILER=/usr/bin/clang++-15 -DCLANG_EXECUTABLE_PATH=/usr/bin/clang++-15 -DLLVM_DIR=/usr/lib/llvm-15/cmake -DWITH_CUDA_BACKEND=ON -DWITH_ROCM_BACKEND=ON -DCMAKE_INSTALL_PREFIX=`pwd`/install -DCUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda -DROCM_PATH=/opt/rocm ..

./install/bin/acpp test.cpp -o test.out -O3 --acpp-targets="cuda:sm_70"

 
## if fails, build llvm from source
https://github.com/AdaptiveCpp/AdaptiveCpp/issues/745
https://github.com/AdaptiveCpp/AdaptiveCpp/blob/b61a18683cb66734b3d6a1d02ab3e3cb6f1d7d8d/doc/install-llvm.md

git clone https://github.com/llvm/llvm-project -b release/15.x
cd llvm-project
mkdir -p build
cd build

INSTALL_PREFIX=/path/to/desired/llvm/installation/directory

cmake -DCMAKE_C_COMPILER=`which gcc` -DCMAKE_CXX_COMPILER=`which g++` \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$INSTALL_PREFIX \
      -DLLVM_ENABLE_PROJECTS="clang;compiler-rt;lld;openmp" \
      -DOPENMP_ENABLE_LIBOMPTARGET=OFF \
      -DCMAKE_BUILD_TYPE=Release \
      -DLLVM_ENABLE_ASSERTIONS=OFF \
      -DLLVM_TARGETS_TO_BUILD="NVPTX;X86" \  
      -DCLANG_ANALYZER_ENABLE_Z3_SOLVER=0 \
      -DLLVM_INCLUDE_BENCHMARKS=0 \
      -DLLVM_INCLUDE_EXAMPLES=0 \
      -DLLVM_INCLUDE_TESTS=0 \
      -DCMAKE_INSTALL_RPATH_USE_LINK_PATH=ON \
      -DCMAKE_INSTALL_RPATH=$INSTALL_PREFIX/lib \
      -DLLVM_ENABLE_OCAMLDOC=OFF \
      -DLLVM_ENABLE_BINDINGS=OFF \
      -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=OFF \
      -DLLVM_BUILD_LLVM_DYLIB=ON \
      -DLLVM_ENABLE_DUMP=OFF  ../llvm

make -j8 install



## 

```

## LLVM

```
wget https://apt.llvm.org/llvm.sh #Convenience script that sets up the repositories
chmod +x llvm.sh

sudo ./llvm.sh 17 #Set up repositories for clang 17
sudo apt install -y libclang-17-dev clang-tools-17 libomp-17-dev llvm-17-dev lld-17


```


### Errors while WIP

```
## error-0
/home/rajesh/temp/adap-cpp/build-cuda/install/bin/acpp test.cpp -o test.out -O3 --acpp-targets="cuda"
acpp error: fatal: No CUDA targets specified

## error-1
/home/rajesh/temp/adap-cpp/build-nvcpp/install/bin/acpp test.cpp -o test.out -O3 --acpp-targets="cuda:sm_70"
clang: warning: CUDA version is newer than the latest supported version 11.5 [-Wunknown-cuda-version]
In file included from <built-in>:1:
In file included from /usr/lib/llvm-14/lib/clang/14.0.0/include/__clang_cuda_runtime_wrapper.h:365:
/usr/lib/llvm-14/lib/clang/14.0.0/include/__clang_cuda_texture_intrinsics.h:696:13: error: no template named 'texture'
            texture<__DataT, __TexT, cudaReadModeNormalizedFloat> __handle,
            ^
/usr/lib/llvm-14/lib/clang/14.0.0/include/__clang_cuda_texture_intrinsics.h:709:13: error: no template named 'texture'
            texture<__DataT, __TexT, cudaReadModeElementType> __handle,
            ^
In file included from <built-in>:1:
/usr/lib/llvm-14/lib/clang/14.0.0/include/__clang_cuda_runtime_wrapper.h:486:10: fatal error: 'curand_mtgp32_kernel.h' file not found
#include "curand_mtgp32_kernel.h"
         ^~~~~~~~~~~~~~~~~~~~~~~~
3 errors generated when compiling for sm_70.

## error-2
 /home/rajesh/temp/adap-cpp/build-llvm17/install/bin/acpp test.cpp -o test.out -O3 --acpp-targets="cuda.integrated-multipass:sm_70"
clang++-17: warning: CUDA version is newer than the latest partially supported version 12.1 [-Wunknown-cuda-version]
In file included from <built-in>:1:
In file included from /usr/lib/llvm-17/lib/clang/17/include/__clang_cuda_runtime_wrapper.h:111:
In file included from /usr/local/cuda/include/cuda_runtime.h:82:
/usr/local/cuda/include/crt/host_config.h:151:2: error: -- unsupported clang version! clang version must be less than 16 and greater than 3.2 . The nvcc flag '-allow-unsupported-compiler' can be used to override this version check; however, using an unsupported host compiler may cause compilation failure or incorrect run time execution. Use at your own risk.
  151 | #error -- unsupported clang version! clang version must be less than 16 and greater than 3.2 . The nvcc flag '-allow-unsupported-compiler' can be used to override this version check; however, using an unsupported host compiler may cause compilation failure or incorrect run time execution. Use at your own risk.
      |  ^
1 error generated when compiling for sm_70.

## errror 3
 /home/rajesh/temp/adap-cpp/build-llvm17/install/bin/acpp test.cpp -o test.out -O3 --acpp-targets="cuda:sm_70" --acpp-cuda-path=/opt/nvidia/hpc_sdk/Linux_x86_64/24.3/cuda
clang++-17: warning: CUDA version is newer than the latest partially supported version 12.1 [-Wunknown-cuda-version]
In file included from <built-in>:1:
In file included from /usr/lib/llvm-17/lib/clang/17/include/__clang_cuda_runtime_wrapper.h:111:
In file included from /opt/nvidia/hpc_sdk/Linux_x86_64/24.3/cuda/include/cuda_runtime.h:82:
/opt/nvidia/hpc_sdk/Linux_x86_64/24.3/cuda/include/crt/host_config.h:151:2: error: -- unsupported clang version! clang version must be less than 16 and greater than 3.2 . The nvcc flag '-allow-unsupported-compiler' can be used to override this version check; however, using an unsupported host compiler may cause compilation failure or incorrect run time execution. Use at your own risk.
  151 | #error -- unsupported clang version! clang version must be less than 16 and greater than 3.2 . The nvcc flag '-allow-unsupported-compiler' can be used to override this version check; however, using an unsupported host compiler may cause compilation failure or incorrect run time execution. Use at your own risk.
      |  ^
In file included from <built-in>:1:
/usr/lib/llvm-17/lib/clang/17/include/__clang_cuda_runtime_wrapper.h:486:10: fatal error: 'curand_mtgp32_kernel.h' file not found
  486 | #include "curand_mtgp32_kernel.h"
      |          ^~~~~~~~~~~~~~~~~~~~~~~~
2 errors generated when compiling for sm_70.


-- > IF BUILD SRC then we should go for LLVM 15?
https://github.com/AdaptiveCpp/AdaptiveCpp/blob/develop/doc/install-llvm.md

/home/rajesh/install/llvm-project/build

INSTALL_PREFIX=/home/rajesh/install/llvm15-src-install


cmake -DCMAKE_INSTALL_PREFIX=`pwd`/install  -DLLVM_CMAKE_DIR=/home/rajesh/install/llvm15-src-install/lib/cmake  -DCLANG_INCLUDE_PATH=/home/rajesh/install/llvm15-src-install/include/  .. 

LLVM_ROOT did not work
cmake/llvm # only builds but can not complie test

cmake -DCMAKE_CXX_COMPILER=/home/rajesh/install/llvm15-src-install/bin/clang++ -DCLANG_EXECUTABLE_PATH=/home/rajesh/install/llvm15-src-install/bin/clang++ -DLLVM_DIR=/home/rajesh/install/llvm15-src-install/lib/cmake/llvm -DWITH_CUDA_BACKEND=ON -DWITH_ROCM_BACKEND=ON -DCMAKE_INSTALL_PREFIX=`pwd`/install -DCUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda -DROCM_PATH=/opt/rocm ..

MABE TRY LLVM 16 src
https://github.com/AdaptiveCpp/AdaptiveCpp/issues/1013


```
