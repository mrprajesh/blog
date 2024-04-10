---
layout: post
title: Geany snippets
date: 10-04-2024 00:58:37 +05:30
tags: [geany, snippets]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---
I love Geany for its simplicity and fast editors. Most of all because of them awesome snippets.
Some of my snippets for later reference.
 

```shell
[Default]
c=//~~START:{command: date +'%a, %d-%b-%Y, %T %Z'}\n//~~AuTHoR:Rajesh Pandian M | mrprajesh.co.in\n#include <bits/stdc++.h> \nusing namespace std; \n \nint main(int argc, char *argv[])  { \n	printf("Hello There!");%cursor%\n	return 0; \n} \n
cpp=//~~START:{command: date +'%a, %d-%b-%Y, %T %Z'}\n//~~AuTHoR:Rajesh Pandian M | mrprajesh.co.in\n#include <bits/stdc++.h> \nusing namespace std; \n \nint main(int argc, char *argv[])  { \n	cout << "Hello There %cursor%" << endl;\n	return 0; \n} \n
cu=//~~START:{command: date +"%a, %d-%b-%Y, %T %Z"}\n//~~AuTHoR:Rajesh Pandian M | mrprajesh.co.in\n#include <stdio.h>\n#include <cuda.h>\n#include <iostream>\n__global__ void k(){\n	printf("hello %u!\\n", threadIdx.x);\n}\nint main(int argc, char *argv[]){\n	k<<<2,32>>>();\n	cudaDeviceSynchronize();\n	return 0;\n}\n

url=[%cursor%]()
printme=void printme(const Container &data){\n  std::copy(data.begin(),\n    data.end(),\n    std::ostream_iterator<typename Container::value_type>(std::cout, " "));\n  std::cout << '\\n';\n}
cout=std::cout<< "%cursor%" << std::endl;
cum=cudaMalloc(&d%cursor, n*sizeof(int));
h2d=cudaMemcpy(dest,src,sizeof(int)*%cursor%n,cudaMemcpyHostToDevice);
d2h=cudaMemcpy(dest,src,sizeof(int)*%cursor%n,cudaMemcpyDeviceToHost);
cds=cudaDeviceSynchronize();

```
