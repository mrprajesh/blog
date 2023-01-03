---
layout: post
title: How to (not) Artifact your code 
date: 03-01-2023 12:11:05 +05:30
tags: [research, artifact]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---
## Art of Artifacting

Some of my experience during my research work on building the artifact for our paper.

> **Disclaimer:** Purely out of my own experiences which is likely to refine/modify as I go along!

1. List the requirements of software/OS/driver and hardware.
2. Any library dependencies, version, etc. You must mention the environment it is tested on!
2. Perform all the baseline computations on the same hardware platform.
3. Include all the testcases or input instances or have makefile to wget form URL.
4. Get instances from published work URLs. Eg. CVRP LIB, STEINLIB, TSPLIB, DIMACS.
5. Mostly, your code should handle different input formats (or parts) without editing inputs.
6. In the worst case, if we are modifying the inputs, we should have provided the converter
7. Executable should've help/man options -- list all runtime args+their default values if not set. 
8. The output should've meaningful labels than printing out just numbers.
9. We should print the time, solution value and solution (optional). 
10. The validation routine can be included (in or separate) that prints if the solution is in/valid. 
11. We can enable/disable via arg some or part of the output.
11. This holds for approx algorithms and parallelizing algorithms from sequential implementation to match/check the expected output.

## More points.

- We must bundle the artifact after submission.
- We must have git/zenodo URL with `README`.
- Our `README` must have instructions to build and reproduce your/baseline results.
- We must have a script that runs all the inputs.
- We must have a script to run each/all baselines.


### Legends

- Artifact. Source code of a research paper to get its plot/fig/times
- baseline. Code/comparison paper
- exe. Executable.
- testcase. Input instances or file for the program.

