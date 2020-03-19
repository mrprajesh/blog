---
layout: post
title: Hovering anchor tag heading in Jekyll
date: 19-03-2020 20:23:24 +05:30
tags: [jekyll, coding]
description:
summary:
comments: false
author: Rajesh Pandian M
---

I like when (sub)heading has anchor links on a long blog post.


## This is an example
Can you see a link for the above heading? Try moving the cursor over the heading

### How to achieve it?
- in `_layouts/default.html` after html tag

```html
<html>
<script src="https://cdn.jsdelivr.net/npm/anchor-js/anchor.min.js">
</script>
...
```

- and just before `</body>`

```html
...
  <script>
    anchors.add();
  </script>
</body>
```

## Have customized it?
```html
<style>
  .anchorjs-link {
    color: #aaa;
  }
  .anchorjs-link:hover {
    color: #ff5231;
  }
</style>

<script>
  anchors.options.placement = 'left';
  anchors.add();
</script>

```

### References
- As [jekyll-anchor-heading](https://github.com/allejo/jekyll-anchor-headings) did not work
- [AnchorJs](https://www.bryanbraun.com/anchorjs/#installation) helped me
- we can anchor `para` as well.
