---
layout: post
title: How to use Latex / MathJax in Jekyll
date: 17-03-2020 16:12:01 +05:30
tags: [jekyll, latex, mathjax]
description:
summary:
comments: false
author: Rajesh Pandian M
---

* create `_include/mathjax.html`
* add the below code

```html
<script type="text/x-mathjax-config">
  MathJax.Hub.Config({
    extensions: [
      "MathMenu.js",
      "MathZoom.js",
      "AssistiveMML.js",
      "a11y/accessibility-menu.js"
    ],
    jax: ["input/TeX", "output/CommonHTML"],
    TeX: {
      extensions: [
        "AMSmath.js",
        "AMSsymbols.js",
        "noErrors.js",
        "noUndefined.js",
      ]
    }
  });
  MathJax.Hub.Register.StartupHook("TeX Jax Ready",function () {
    var TEX = MathJax.InputJax.TeX;
    var COLS = function (W) {
      var WW = [];
      for (var i = 0, m = W.length; i < m; i++)
        {WW[i] = TEX.Parse.prototype.Em(W[i])}
      return WW.join(" ");
    };
    TEX.Definitions.Add({
      environment: {
        psmallmatrix: ['Array',null,'(',')','c',COLS([1/3]),".2em",'S',1],
      }
    });
  });
</script>
<script type="text/javascript" async
  src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/latest.js">
</script>

```

* edit `_layouts/default.html` add a include line before `</body>`
> {\% include mathjax.html \%\}
>> Caution: Remove `\` before `%` (at the beginning and at the end).
> For some reason jekyll is not allowing me write it

- that's it. Enclose math symbols within `$$`
- e.g Some random $$A_{m \times n} \cdot B^{n} = C_n $$
```tex
$$A_{m \times n} \cdot B^{n} = C_n $$
```
- some text $$\TeX$$



### References
- Thanks to Arthur O’Dwyer
- [Blog](https://quuxplusone.github.io/blog/2018/08/05/mathjax-in-jekyll/)
- [Git code](https://github.com/Quuxplusone/blog/commit/a829f7fae66a51771c30ed259739650524c60e66)
