---
layout: post
title: Print Vector function
date: 15-10-2021 11:36:26 +05:30
tags: [cpp,print,coding]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

Note the comments in-line. This is how my `print vector` function refined
over the years.


```c
//~~~START:Fri, 15-Oct-2021, 11:44:30 IST
//~~~Author:Rajesh Pandian M | mrprajesh.co.in
#include <bits/stdc++.h>
using namespace std;

// I used to print this way before I know range-based for loop
void printVec1(vector<int> vec){
  vector<int>::iterator it;
  for(auto it=vec.begin(); it!=vec.end(); ++it)
    std::cout<< *it << ' ';
  std::cout<< '\n';
}

// After I know range based for loop
void printVec2(vector<int> vec){
  for(auto v: vec)
    std::cout<< v << ' ';
  std::cout<< '\n';
}

// After I know templates, const usages, refs and auto
template <typename T>
void printVec3(const vector<T> &vec){
  for(const auto &v: vec)
    cout << v << ' ';
  cout<< '\n';
}

// After I know copy and ostream iterator.
void printVec4(const auto &data){
  std::copy(data.begin(),
            data.end(),
            std::ostream_iterator<int>(std::cout, " "));
  std::cout << '\n';
}

// Templating above! #include <iterator>
template <typename Container>
void printVec5(const Container &data){
  std::copy(data.begin(),
    data.end(),
    std::ostream_iterator<typename Container::value_type>(std::cout, " "));
  std::cout << '\n';
}

int main(int argc, char* argv[]){
  vector <int> v= {11,22,33,44,55};
  printVec1(v);
  printVec2(v);
  printVec3(v);
  printVec4(v);
  printVec5(v);

  return 0;
}

```

Can we template the `printVec4`? <s> I still do not know <s> . Found it!
