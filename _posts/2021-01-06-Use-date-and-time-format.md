---
layout: post
title: Use standard date and time format
date: 06-01-2021 17:59:37 +05:30
tags: [date, time]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

#### Date
My brother's birth day is `11-04-1994`. It is natural to
get confused as `04-Nov` if are an US/Europen citizen. :open_mouth: His birthday is  on `11-April`. :yum: So, it is always better write (or store in system)
date **unambiguously** despite your locality. :thinking:


```c
DD-Mon-YYYY
```

is my favourite for several reasons because it uses constant `11` chars. Prefer to prefix `0` if DD is single digit. You can do that to your pen signature as well. It is tamper proof. So,
the right way is `11-Apr-1994` :sunglasses:

#### Time

Similar thing goes for time as well. I am in India and we follow IST. There might be others who are reading it from a different time zone.
You might have responded to email the next minute. But
based on how email clients are configure might show a different time of you reply/received time. It compounds with AM+PM thing.
So, let's follow a 24 hours standard time along with mentioning your shift or your time zone. e.g `GMT+0530` or `IST`. That way it is unambiguous.

```c
HH:MM:SS GMT+/- hhss
```

If you are on linux,

```c
date +"%d-%b-%Y %T (GMT%z)"
06-Jan-2021 18:31:38 (GMT+0530)
date +"%d-%b-%Y %T (%Z)"
06-Jan-2021 18:32:02 (IST)
```
Again this uses constant chars irrespective of date and time 24/7 (for another ~8000 years :sweat_smile:). By the way GMT and UTC mean the same.

#### Currency

Similarly, for currency: $  and Rs.  Better to use USD or INR instead.

Let's me stop here for now.

:mask: Up and stay safe.

Cheers,


Rajz

