---
layout: post
title: How to run cpp on jupyter notebook
date: 26-12-2022 13:42:46 +05:30
tags: [jekyll, coding]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

# Requirements
- Conda
- Works on Ubuntu 20.04 


We use [xeus-cling](https://github.com/jupyter-xeus/xeus-cling) to run cpp on jupyter notebook.
Check out [My GitHub repo](https://github.com/mrprajesh/run-cpp-on-jupyter) & [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/mrprajesh/run-cpp-on-jupyter/HEAD?labpath=HelloCppJupyter.ipynb)

```c
#Download minconda 
Download and run file for linux x64 https://docs.conda.io/en/latest/miniconda.html 
                       
# DO NOT ENABLE BY DEFAULT
conda config --set auto_activate_base false

# HAVE A DEFAULT
conda update -n base -c defaults conda

# CREATE ONE FOR CLING
conda create -n cling

#INSTALL THE REQUIRED
conda install jupyter 
conda install notebook

#ACTIVATE
conda activate cling   #okay!

# INSTALL
conda install xeus-cling -c conda-forge #NOT WORKING?

#RUN
jupyter notebook 

# Browse
http://localhost:8888/

Choose C++11/14/17 from dropdown based on requrement.
```

### The Activate and Run step is what we require after installation.
Check out my [github repo](https://github.com/mrprajesh/run-cpp-on-jupyter)

```c
git clone https://github.com/mrprajesh/run-cpp-on-jupyter.git

cd run-cpp-on-jupyter

#ACTIVATE
conda activate cling   

#RUN
jupyter notebook 

# Open Browser, Write and Run
# Usually it is http://localhost:8888/

```

### Office use.

```c
#ACTIVATE
source activate cling   #not working


# LETS DOWNGRADE
conda install xeus-cling==0.9.0 -c conda-forge

# NOT WORKING
jupyter console --kernel xcpp14 
jupyter kernelspec install PREFIX/share/jupyter/xcpp14 --sys-prefix
```
