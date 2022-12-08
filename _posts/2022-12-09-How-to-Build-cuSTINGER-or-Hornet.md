---
layout: post
title: How to Build cuSTINGER or Hornet
date: 09-12-2022 02:23:16 +05:30
tags: [cuda,hornet]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

- On Ubuntu 20.04.
- cuSTINGER is outdated. [Hornet](https://github.com/hornet-gt/hornet/) is comparitively active.
- Tried the current master. SOA / AOS seems half baked.
- Let's try from release. [Pre SOA](https://github.com/hornet-gt/hornet/archive/refs/tags/0.5.zip)
- rename ext/cud folder as CUB is bundle with CUDA Now.
- CMake 23 had some error w.r.t cuda architecture. using 3.16
- `cd hornet-0.5/hornet/build`
- `rm -rf * ; cmake ..; make -j4`
- on `hornet-0.5/hornet/include/Core/DataLayout/DataLayoutDev.i.cuh`  make Line 43 as `AoSdev<TArgs...>::AoSdev(void* d_ptr):`
removed the template parm pack for ctor
- `rm -rf * ; cmake ..; make -j4`
```c
rm -rf * ; cmake ..; make -j4
-- The CXX compiler identification is GNU 9.4.0
-- The CUDA compiler identification is NVIDIA 11.7.64
-- Check for working CXX compiler: /usr/bin/c++
-- Check for working CXX compiler: /usr/bin/c++ -- works
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Check for working CUDA compiler: /usr/local/cuda-11.7/bin/nvcc
-- Check for working CUDA compiler: /usr/local/cuda-11.7/bin/nvcc -- works
-- Detecting CUDA compiler ABI info
-- Detecting CUDA compiler ABI info - done
-- Found OpenMP_CXX: -fopenmp (found version "4.5") 
-- Found OpenMP: TRUE (found version "4.5")  
-- Using Nvidia Tools Extension
-- Configuring done
-- Generating done
-- Build files have been written to: /home/rajesh/temp/hornet-0.5/hornet/build
Scanning dependencies of target hornet
[  6%] Building CXX object CMakeFiles/hornet.dir/src/Util/CommandLineParam.cpp.o
[  6%] Building CXX object CMakeFiles/hornet.dir/home/rajesh/temp/hornet-0.5/xlib/src/Device/Util/CudaUtil.cpp.o
[  9%] Building CXX object CMakeFiles/hornet.dir/src/Util/BatchFunctions.cpp.o
[ 12%] Building CXX object CMakeFiles/hornet.dir/home/rajesh/temp/hornet-0.5/xlib/src/Device/Util/DeviceProperties.cpp.o
[ 15%] Building CXX object CMakeFiles/hornet.dir/home/rajesh/temp/hornet-0.5/xlib/src/Device/Util/SafeCudaAPI.cpp.o
[ 18%] Building CXX object CMakeFiles/hornet.dir/home/rajesh/temp/hornet-0.5/xlib/src/Graph/BFS.cpp.o
[ 21%] Building CXX object CMakeFiles/hornet.dir/home/rajesh/temp/hornet-0.5/xlib/src/Graph/BellmanFord.cpp.o
[ 25%] Building CXX object CMakeFiles/hornet.dir/home/rajesh/temp/hornet-0.5/xlib/src/Graph/Brim.cpp.o
[ 28%] Building CXX object CMakeFiles/hornet.dir/home/rajesh/temp/hornet-0.5/xlib/src/Graph/Dijkstra.cpp.o
[ 31%] Building CXX object CMakeFiles/hornet.dir/home/rajesh/temp/hornet-0.5/xlib/src/Graph/GraphBase.cpp.o
[ 34%] Building CXX object CMakeFiles/hornet.dir/home/rajesh/temp/hornet-0.5/xlib/src/Graph/GraphStd.cpp.o
[ 37%] Building CXX object CMakeFiles/hornet.dir/home/rajesh/temp/hornet-0.5/xlib/src/Graph/GraphStdRead.cpp.o
[ 40%] Building CXX object CMakeFiles/hornet.dir/home/rajesh/temp/hornet-0.5/xlib/src/Graph/GraphWeight.cpp.o
[ 43%] Building CXX object CMakeFiles/hornet.dir/home/rajesh/temp/hornet-0.5/xlib/src/Graph/GraphWeightRead.cpp.o
[ 46%] Building CXX object CMakeFiles/hornet.dir/home/rajesh/temp/hornet-0.5/xlib/src/Graph/SCC.cpp.o
[ 50%] Building CXX object CMakeFiles/hornet.dir/home/rajesh/temp/hornet-0.5/xlib/src/Graph/WCC.cpp.o
[ 53%] Building CXX object CMakeFiles/hornet.dir/home/rajesh/temp/hornet-0.5/xlib/src/Host/FileUtil.cpp.o
[ 56%] Building CXX object CMakeFiles/hornet.dir/home/rajesh/temp/hornet-0.5/xlib/src/Host/PrintExt.cpp.o
[ 59%] Building CUDA object CMakeFiles/hornet.dir/home/rajesh/temp/hornet-0.5/xlib/src/Device/Primitives/CubWrapper.cu.o
[ 62%] Linking CXX static library libhornet.a
[ 62%] Built target hornet
Scanning dependencies of target hornet_delete_test
Scanning dependencies of target hornet_insert_test
Scanning dependencies of target ptxtest
Scanning dependencies of target mem_benchmark
[ 68%] Building CUDA object CMakeFiles/ptxtest.dir/test/ptxtest.cu.o
[ 68%] Building CUDA object CMakeFiles/mem_benchmark.dir/test/MemBenchmark.cu.o
[ 71%] Building CUDA object CMakeFiles/hornet_delete_test.dir/test/HornetDeleteTest.cu.o
[ 75%] Building CUDA object CMakeFiles/hornet_insert_test.dir/test/HornetInsertTest.cu.o
[ 78%] Linking CXX executable ptxtest
[ 81%] Linking CXX executable mem_benchmark
[ 81%] Built target ptxtest
Scanning dependencies of target hornet_test
[ 84%] Building CUDA object CMakeFiles/hornet_test.dir/test/HornetTest.cu.o
[ 84%] Built target mem_benchmark
Scanning dependencies of target lb_test
[ 87%] Building CUDA object CMakeFiles/lb_test.dir/test/BinarySearchTest.cu.o
[ 90%] Linking CXX executable hornet_insert_test
[ 90%] Built target hornet_insert_test
[ 93%] Linking CXX executable hornet_delete_test
[ 93%] Built target hornet_delete_test
[ 96%] Linking CXX executable lb_test
[ 96%] Built target lb_test
[100%] Linking CXX executable hornet_test
[100%] Built target hornet_test
[ble: elapsed 36.194s (CPU 158.6%)] rm -rf * ; cmake ..; make -j4
```

# office use.


```c
/home/rajesh/temp/hornet-0.5/hornet/include/Core/DataLayout/DataLayoutDev.i.cuh(43): error: name followed by "::" must be a class or namespace name

/home/rajesh/temp/hornet-0.5/hornet/include/Core/DataLayout/DataLayoutDev.i.cuh(43): error: argument list for class template "hornets_nest::AoSdev" is missing

/home/rajesh/temp/hornet-0.5/hornet/include/Core/DataLayout/DataLayoutDev.i.cuh(43): error: expected a ";"

/home/rajesh/temp/hornet-0.5/hornet/include/Core/DataLayout/DataLayoutDev.i.cuh(115): warning #12-D: parsing restarts here after previous syntax error

/home/rajesh/temp/hornet-0.5/hornet/include/Core/DataLayout/DataLayoutDev.i.cuh(43): error: name followed by "::" must be a class or namespace name

/home/rajesh/temp/hornet-0.5/hornet/include/Core/DataLayout/DataLayoutDev.i.cuh(43): error: argument list for class template "hornets_nest::AoSdev" is missing

/home/rajesh/temp/hornet-0.5/hornet/include/Core/DataLayout/DataLayoutDev.i.cuh(43): error: expected a ";"


```
