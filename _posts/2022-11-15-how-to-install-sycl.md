---
layout: post
title: How to Install, Compile and Run SYCL using NVIDIA GPUs
date: 15-11-2022 10:12:43 +05:30
tags: [sycl, cuda, nvidia, intel, oneapi, dpcpp]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

### Prerequisites

- [All preq for LLVM](https://intel.github.io/llvm-docs/GetStartedGuide.html#prerequisites)
  - git
  - cmake version 3.14+
  - python
  - ninja 
  - C++ compiler GCC version 7.1.0+ (TLDR C++17 support)
- CUDA Toolkit 11.5+ in default path _(11.7 and 11.8 are only partially supported as on date!)_
- I am using Ubuntu 20.04; should work any Linux which has all above.

### Build a C++ Complier for SYCL

```c
#Create folder; Assume is as $DPCPP_HOME
mkdir $HOME/install
cd $HOME/install

# Build INTEL's LLVM
# get sycl branch
git clone https://github.com/intel/llvm.git -b sycl
cd llvm

# configure
python ./buildbot/configure.py --cuda -t release --cmake-gen "Unix Makefiles"

# Assuming no error. Build takes 20mins. Get a coffee!
cd build
make sycl-toolchain -j `nproc`
make install

# assumes $HOME/install/llvm installation
```

### HelloWorld SYCL - Compile and Run


- **Step1.** create a file `simple-sycl-app-cuda.cpp`

```c
#include <sycl/sycl.hpp>

int main() {
  // Creating buffer of 4 ints to be used inside the kernel code
  sycl::buffer<sycl::cl_int, 1> Buffer(4);

  // Creating SYCL queue
  sycl::queue Queue;

  // Size of index space for kernel
  sycl::range<1> NumOfWorkItems{Buffer.size()};

  // Submitting command group(work) to queue
  Queue.submit([&](sycl::handler &cgh) {
    // Getting write only access to the buffer on a device
    auto Accessor = Buffer.get_access<sycl::access::mode::write>(cgh);
    // Executing kernel
    cgh.parallel_for<class FillBuffer>(
        NumOfWorkItems, [=](sycl::id<1> WIid) {
          // Fill buffer with indexes
          Accessor[WIid] = (sycl::cl_int)WIid.get(0);
        });
  });

  // Getting read only access to the buffer on the host.
  // Implicit barrier waiting for queue to complete the work.
  const auto HostAccessor = Buffer.get_access<sycl::access::mode::read>();

  // Check the results
  bool MismatchFound = false;
  for (size_t I = 0; I < Buffer.size(); ++I) {
    if (HostAccessor[I] != I) {
      std::cout << "The result is incorrect for element: " << I
                << " , expected: " << I << " , got: " << HostAccessor[I]
                << std::endl;
      MismatchFound = true;
    }
  }

  if (!MismatchFound) {
    std::cout << "The results are correct!" << std::endl;
  }

  return MismatchFound;
}

```

- **Step 2**. Exports

```c
# do it
export PATH=$HOME/install/llvm/build/bin:$PATH
export LD_LIBRARY_PATH=$HOME/install/llvm/build/lib:$LD_LIBRARY_PATH

# verify
$ clang++ --version
clang version 16.0.0
  
```

- **Step 3.** Compile and run

```c
#complie
clang++ -fsycl -fsycl-targets=nvptx64-nvidia-cuda simple-sycl-app.cpp -o simple-sycl-app-cuda

#run
./simple-sycl-app-cuda
The results are correct!

```
 

## Non-default CUDA installation

If CUDA installation folder is different or default CUDA is not the required version. 
Modify only two steps from above rest is the same.
Assuming SYCL to use this `/usr/local/cuda-11.5` version. 

```c
...
# configure
python3 ./buildbot/configure.py --cuda -t release --cmake-gen "Unix Makefiles" --cmake-opt="-DCUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda-11.5"

...

# compile
clang++ -fsycl -fsycl-targets=nvptx64-nvidia-cuda simple-sycl-app.cpp -o simple-sycl-app-cuda --cuda-path=/usr/local/cuda-11.5/
```

That's it. TATA.


### References

- [https://codeplay.com/solutions/oneapi/for-cuda/#getting-started](https://codeplay.com/solutions/oneapi/for-cuda/#getting-started)
- [
https://intel.github.io/llvm-docs/GetStartedGuide.html#build-dpc-toolchain-with-support-for-nvidia-cuda](
https://intel.github.io/llvm-docs/GetStartedGuide.html#build-dpc-toolchain-with-support-for-nvidia-cuda)
