---
layout: post
title: Run program with inputs and write output files
date: 22-12-2021 09:59:47 +05:30
tags: [cpp, shell]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

Most of the time, We wanted to run an executable on several input
instances and store the corresponding results using a shell script.
The location of input and output folders are specified in the script. However, we wanted
output file to be in a specific format. This below thing works irrespective of the
depth of the folder location.

Example:

`some/folder/inputFileWith.ext` to  `some/other/folder/outFileWithDifferent.extension`

```c
#!/bin/bash
INPUT=some/folder            #no need to suffix /
OUTPUT=some/other/folder     #no need to suffix /
for f in $INPUT/*vrp
do
  #fileName=$(echo $f | cut -f3 -d'/' | cut -f1 -d'.') # NOT GENERIC. DOES NOT WORK for NON-TWO LEVEL LOCATION
  #fileName=$(echo $f | rev | cut -f1 -d'/' | rev | cut -f1 -d'.') # SLOWER THAN BELOW
  fileName=$(echo $f | awk -F[./] '{print $(NF-1)}')
  #echo $f and $fileName
  ./runExe < $f > $OUTPUT/$fileName.sol
done
```

