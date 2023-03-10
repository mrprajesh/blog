---
layout: post
title: How To Install Tensorflow GPU
date: 10-03-2023 15:40:51 +05:30
tags: [tensorflow,nvidia,gpu]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

### Requirements
- Python 3.9+
- Conda
- NVidia GPU
- Ubuntu 20.04

It was pretty straightforward from Official docs. 

```c

conda create --name tf python=3.9

conda activate tf

(tf) nvidia-smi

(tf) conda install -c conda-forge cudatoolkit=11.2.2 cudnn=8.1.0

(tf) export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CONDA_PREFIX/lib/

(tf) pip install --upgrade pip

(tf) pip install tensorflow


(tf) python3 -c "import tensorflow as tf; print(tf.reduce_sum(tf.random.normal([1000, 1000])))"

  python3 -c "import tensorflow as tf; print(tf.reduce_sum(tf.random.normal([1000, 1000])))"
  2023-03-10 14:15:53.991865: I tensorflow/core/platform/cpu_feature_guard.cc:193] This TensorFlow binary is optimized with oneAPI Deep Neural Network Library (oneDNN) to use the following CPU instructions in performance-critical operations:  AVX2 AVX_VNNI FMA
  To enable them in other operations, rebuild TensorFlow with the appropriate compiler flags.
  ...
  2023-03-10 14:15:55.331872: I tensorflow/compiler/xla/stream_executor/cuda/cuda_gpu_executor.cc:981] successful NUMA node read from SysFS had negative value (-1), but there must be at least one NUMA node, so returning NUMA node zero
  2023-03-10 14:15:55.331944: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1613] Created device /job:localhost/replica:0/task:0/device:GPU:0 with 3801 MB memory:  -> device: 0, name: NVIDIA GeForce RTX 3060 Laptop GPU, pci bus id: 0000:01:00.0, compute capability: 8.6
  tf.Tensor(-110.189026, shape=(), dtype=float32)

(tf) python3 -c "import tensorflow as tf; print(tf.config.list_physical_devices('GPU'))"

  2023-03-10 14:16:25.743784: I tensorflow/compiler/xla/stream_executor/cuda/cuda_gpu_executor.cc:981] successful NUMA node read from SysFS had negative value (-1), but there must be at least one NUMA node, so returning NUMA node zero
  2023-03-10 14:16:25.765042: I tensorflow/compiler/xla/stream_executor/cuda/cuda_gpu_executor.cc:981] successful NUMA node read from SysFS had negative value (-1), but there must be at least one NUMA node, so returning NUMA node zero
  2023-03-10 14:16:25.765153: I tensorflow/compiler/xla/stream_executor/cuda/cuda_gpu_executor.cc:981] successful NUMA node read from SysFS had negative value (-1), but there must be at least one NUMA node, so returning NUMA node zero
  [PhysicalDevice(name='/physical_device:GPU:0', device_type='GPU')]

```


### Refs
- [Official Docs](https://www.tensorflow.org/install/pip)
- [Issue](https://github.com/AUTOMATIC1111/stable-diffusion-webui/issues/5926#issuecomment-1445364980)
 
