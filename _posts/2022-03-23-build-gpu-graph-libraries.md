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
```c
module load cmake3.18 gcc640 python385 cuda10.0
mkdir GraphItG2; cd GraphItG2; 
git clone -b gpu-merge https://github.com/GraphIt-DSL/graphit.git .
mkdir build; cd build
cmake ..
make -j 32

cd ../graphit_eval/g2_cgo2021_eval/dataset
make small # or just make
cd ..
python3 gen_table7.py small    # without small it will run all dataset


# ON AQUA

python3 gen_table7.py small < input

## input file edit accordingly on aqua

cat input
/lfs/usrhome/phd/cs16d003/install/GraphItG2/graphit_eval/g2_cgo2021_eval/table7_outputs
/lfs/usrhome/phd/cs16d003/install/GraphItG2/graphit_eval/g2_cgo2021_eval/../../build
/lfs/usrhome/phd/cs16d003/install/GraphItG2/graphit_eval/g2_cgo2021_eval/dataset
/lfs/sware/cuda-10.1/bin/nvcc
/lfs/sware/gcc640/bin/g++


//TODO make it run via qsub
```


<div style="position: relative; padding-bottom: 56.25%; height: 0;"><iframe src="https://www.loom.com/embed/8f3b9e95847c4894b8f4c69aab45773f?sid=9dfd364b-ad1a-43d5-8f24-da6448bf0a12" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"></iframe></div>


### GSwitch

```c
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


```c
module load cmake3.18
module load cuda-9.2
```
[src build gcc 5.4.0](https://mrprajesh.co.in/blog/install-gcc.html) at install prefix `/lfs/usrhome/phd/cs16d003/install/gcc54/bin`

```c
cmake .. -DCUDA_TOOLKIT_ROOT_DIR=/lfs/sware/cuda-9.2 -DCMAKE_C_COMPILER=/lfs/usrhome/phd/cs16d003/install/gcc54/bin/gcc-5.4 -DCMAKE_CXX_COMPILER=/lfs/usrhome/phd/cs16d003/install/gcc54/bin/g++-5.4```


[Git Issue](https://github.com/mrprajesh/sep-graph/issues/1#issuecomment-1075839359)
