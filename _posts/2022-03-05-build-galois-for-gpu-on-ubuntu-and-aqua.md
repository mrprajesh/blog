---
layout: post
title: Build Galois release 6.0  on ubuntu and aqua
date: 05-03-2022 04:17:47 +05:30
tags: [galois, ubuntu, linux, cmake, llvm, gpu, aqua]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

# Building Galois for GPU on aqua

Step 1. [aqua](https://hpce.iitm.ac.in/content.php?navigate=aquacluster), a cluster at IITM.
```c
# no need default is okay gcc --version gcc (GCC) 9.2.0
export BOOST_ROOT=/sware/boost_1_74_0/  #FIX: Error 1
module load cmake3.18

git clone -b release-6.0 git@github.com:IntelligentSoftwareSystems/Galois.git #https://github.com/IntelligentSoftwareSystems/Galois
cd Galois
git submodule init
git submodule
mdkir build
```

Step 2. GOTO: [LLVM](#llvm)

Step 3.
```c
# FIX: warning and ERROR 2 (last two flags)
cmake .. -DGALOIS_CUDA_CAPABILITY="7.0" -DCMAKE_CUDA_ARCHITECTURES=70 -DLLVM_DIR=/lfs/usrhome/phd/cs16d003/install/llvm-8.0.1.src/build/lib/cmake/llvm
# reports errors cuda not supported over 8
module load gcc640
# do not rm -rf *
cmake .. -DGALOIS_CUDA_CAPABILITY="7.0" -DCMAKE_CUDA_ARCHITECTURES=70 -DLLVM_DIR=/lfs/usrhome/phd/cs16d003/install/llvm-8.0.1.src/build/lib/cmake/llvm
# get the DIR path from prev step
```

Step 4. GOTO: [post build](#post-build)


## On Ubuntu 18.04 or Linux Mint

Step 1.
```c
# if boost already preset, else add the last pkg
sudo apt-get install libfmt-dev llvm-7-dev #libboost-dev
```
see below

Step 2.
```c
git clone -b release-6.0 https://github.com/IntelligentSoftwareSystems/Galois

cd Galois
git submodule init
git submodule
mdkir build
cmake .. -DGALOIS_CUDA_CAPABILITY="5.0"  # as deviceQuery gave me CC 5.0
```
Step 3. See below: [post build](#post-build)

## post build

```c
make input
cd lonestar;
cd analytics/gpu
make -j2
cd sssp
./sssp-gpu
usage: ./sssp-gpu [-q] [-g gpunum] [-o output-file] [-l] [-d delta] [-s startNode] graph-file
 -l: enable thread block load balancer (by default false)

```

### LLVM

```c
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-8.0.1/llvm-8.0.1.src.tar.xz
tar xf llvm-8.0.1.src.tar.xz
cd llvm-8.0.1.src
mkdir build && cd build
cmake .. -DLLVM_ENABLE_RTTI=ON #flag must for Galois
#note the path of build/lib/cmake
```


##  for office use only ;)

The below are NOT NEEDED only my refs! It has the errors/paths I came through.

```c
cmake --build .
cmake --build . --target install
cmake -DCMAKE_INSTALL_PREFIX=~/install/llvm -P cmake_install.cmake


================== ERROR 1 ===============


CMake Error at /lfs/sware/cmake3.18.2/share/cmake-3.18/Modules/FindPackageHandleStandardArgs.cmake:165 (message):
  Could NOT find Boost (missing: Boost_INCLUDE_DIR serialization iostreams)
  (Required is at least version "1.58.0")
Call Stack (most recent call first):
  /lfs/sware/cmake3.18.2/share/cmake-3.18/Modules/FindPackageHandleStandardArgs.cmake:458 (_FPHSA_FAILURE_MESSAGE)
  /lfs/sware/cmake3.18.2/share/cmake-3.18/Modules/FindBoost.cmake:2177 (find_package_handle_standard_args)
  CMakeLists.txt:155 (find_package)


================== ERROR 2 ===============
CMake Error at CMakeLists.txt:157 (find_package):
  Could not find a package configuration file provided by "LLVM" with any of
  the following names:

    LLVMConfig.cmake
    llvm-config.cmake

  Add the installation prefix of "LLVM" to CMAKE_PREFIX_PATH or set
  "LLVM_DIR" to a directory containing one of the above files.  If "LLVM"
  provides a separate development package or SDK, be sure it has been
  installed.

=========== warning =========
CMake Warning (dev) in lonestar/scientific/gpu/delaunayrefinement/CMakeLists.txt:
  Policy CMP0104 is not set: CMAKE_CUDA_ARCHITECTURES now detected for NVCC,
  empty CUDA_ARCHITECTURES not allowed.  Run "cmake --help-policy CMP0104"
  for policy details.  Use the cmake_policy command to set the policy and
  suppress this warning.

```

## OTHERS
```c
sssp rmat15 rmat15.out sssp -s 0 -o rmat15.out ${BASEINPUT}/scalefree/rmat15.gr

cmake -DCMAKE_C_COMPILER=$(which gcc-8) -DCMAKE_CXX_COMPILER=$(which g++-8) \
      -DWITH_CUDA=ON ..
```

## REFERENCES

- [Galois GPU Readme](https://github.com/IntelligentSoftwareSystems/Galois/blob/master/lonestar/analytics/gpu/README.md)
- [LLMV Download](https://github.com/llvm/llvm-project/releases/tag/llvmorg-8.0.1)
- [LLVM Build](https://llvm.org/docs/CMake.html)
- [CMake edit options](https://github.com/espressomd/espresso/issues/3654#issue-597872007)
- [CUDA Arch](https://github.com/facebookresearch/faiss/issues/1424#issuecomment-699208014)

