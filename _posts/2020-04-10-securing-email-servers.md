---
layout: post
title: Securing email servers
date: 10-04-2020 16:08:45 +05:30
tags: [email, tech]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

To get a background on the issue,
read [this](https://www.vox.com/recode/2020/4/2/21202852/coronavirus-scam-email-who-spoofing-domain-dmarc) or see the video from vox. :sunglasses:
We had a similar issues in our department as well.
Someone sent email impersonating our HoD's cse email. OMG! :flushed:

<iframe width="560" height="315" src="https://www.youtube.com/embed/_CrbHvbvvMw" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

> In brief, any scammers can impersonate and send email from legitimate
domain name if email admins do not have secure configuration (appropriate DMARC record). For e.g cse.iitm.ac.in or who.int domain for [CSE IITM](https://www.cse.iitm.ac.in/) or [WHO](https://www.who.int/)


How find if you are vulnerable? or Check your DMARC record for


> See [here](https://www.dmarcanalyzer.com/dmarc/dmarc-record-check)


How to resolve it?

> Add a DMARC record as said [here](https://www.dmarcanalyzer.com/how-to-create-a-dmarc-record/)

This is a simple thing
But, only 15% servers has done this setup. That's strange, isn't? :anguished:

Roll out progressively and monitor daily log.
Otherwise, you may end up genuine mails being dropped/lost.
As said in this [post](https://www.dmarcanalyzer.com/how-to-create-a-dmarc-record/) under section *Deploy your DMARC policy slowly*.

Cheers, bye!
