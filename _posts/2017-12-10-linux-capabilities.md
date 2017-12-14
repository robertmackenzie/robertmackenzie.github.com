---
layout: post
title: "Use setcap rather than sudo"
published: false
---

At some point I was trying to run an HTTP server on port 443 during development without using `sudo`. Turns out there is a tool called `setcap` to achieve this. When I understand a tool enough to use, but not to be satisfied, I create a Gist to return to. This is what I had done:

```sh
sudo setcap 'cap_net_bind_service=+ep' ~/.rbenv/versions/2.2.2/bin/ruby
ruby -run -e httpd . -p 443
```

`man setcap` refers you to `man capabilities`. At nearly 500 lines long, I thought it might be worth a post to digest it.
