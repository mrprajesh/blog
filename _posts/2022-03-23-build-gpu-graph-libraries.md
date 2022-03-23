---
layout: post
title: build gpu graph libraries Graphit, GSwitch and SepGraph
date: 23-03-2022 08:57:52 +05:30
tags: [GraphIt, GSwitch]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

On AQUA.

### Gpu Graphit G2

module load cmake3.18
module load gcc640
mkdir GraphItG2; cd GraphItG2; git clone --recursive -b gpu-merge https://github.com/GraphIt-DSL/graphit.git .
mkdir build; cd build
cmake ..
make -j 32

cd ../graphit_eval/g2_cgo2021_eval/dataset
make small # or just make
python3 gen_table7.py small < input

input
/lfs/usrhome/phd/cs16d003/install/GraphItG2/graphit_eval/g2_cgo2021_eval/table7_outputs
/lfs/usrhome/phd/cs16d003/install/GraphItG2/graphit_eval/g2_cgo2021_eval/../../build
/lfs/usrhome/phd/cs16d003/install/GraphItG2/graphit_eval/g2_cgo2021_eval/dataset
/lfs/sware/cuda-10.1/bin/nvcc
/lfs/sware/gcc640/bin/g++
0

//TODO make it run via qsub

### GSwitch

```
module load cmake3.18
module load gcc640
cmake ..
make -j 32
Scanning dependencies of target gswitch
[  7%] Linking CXX static library libgswitch.a
[  7%] Built target gswitch
[ 30%] Building NVCC (Device) object application/CMakeFiles/GC.dir/GC_generated_gc.cu.o
[ 38%] Building NVCC (Device) object application/CMakeFiles/SSSP.dir/SSSP_generated_sssp.cu.o
[ 38%] Building NVCC (Device) object application/CMakeFiles/PageRank.dir/PageRank_generated_pagerank.cu.o
[ 38%] Building NVCC (Device) object application/CMakeFiles/BC.dir/BC_generated_bc.cu.o
[ 53%] Building NVCC (Device) object application/CMakeFiles/CC.dir/CC_generated_cc.cu.o
[ 53%] Building NVCC (Device) object application/CMakeFiles/BFS.dir/BFS_generated_bfs.cu.o
..
Scanning dependencies of target PageRank
[ 69%] Linking CXX executable PageRank
[ 69%] Built target PageRank
Scanning dependencies of target SSSP
[ 76%] Linking CXX executable SSSP
Scanning dependencies of target BFS
[ 84%] Linking CXX executable BFS
Scanning dependencies of target GC
[ 92%] Linking CXX executable GC
[ 92%] Built target SSSP
[ 92%] Built target BFS
[ 92%] Built target GC
Scanning dependencies of target BC
[100%] Linking CXX executable BC
[100%] Built target BC

```

### SEP-Graph


```
module load cmake3.18
module load cuda-9.2
```
[src build gcc 5.4.0](https://mrprajesh.co.in/blog/install-gcc.html) at install prefix `/lfs/usrhome/phd/cs16d003/install/gcc54/bin`

```cmake .. -DCUDA_TOOLKIT_ROOT_DIR=/lfs/sware/cuda-9.2 -DCMAKE_C_COMPILER=/lfs/usrhome/phd/cs16d003/install/gcc54/bin/gcc-5.4 -DCMAKE_CXX_COMPILER=/lfs/usrhome/phd/cs16d003/install/gcc54/bin/g++-5.4```


[Git Issue](https://github.com/mrprajesh/sep-graph/issues/1#issuecomment-1075839359)
