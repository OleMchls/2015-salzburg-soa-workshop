# Challenge 02 - telnet & cURL & netcat

You have learned how HTTP request and response work. Now it is time to feel it!

In order to work with the HTTP protokoll you need to know some handy tools.

# Setup

Nothing to do here...

# Development

This challenge consists of multiple steps.

Complete the following tasks:
- [ ] Send a HTTP request using `cURL` to `news.ycombinator.com` and inspect the HTTP protocol. *(hint: use `curl -vv`)*
- [ ] Open a TCP connection with `telnet` to `news.ycombinator.com` on port `80` and send a valid HTTP request and make the server reply to you with a HTTP 301 redirect. Optional: try different sites. Find a site which does not respond with a redirect and fetch their content.
- [ ] Open a TCP server on port 9292 using the netcat `nc` utility. `nc -l 9292`
- [ ] Use the `cURL` utility to make a HTTP request to your netcat server, without making curl crash, or quit.

# Test / Compliance

Now find a fellow student. Now try to open the last two challenges again, but this time you open a netcat server and your peer makes the request and vice versa.

To skip all the networking in between there is a utility on the development machine called `ngrok` with ngrok you can expose (tunnel) a HTTP connection to the outside world.

Expose :9292 with ngrok

```sh
$ ngrok 9292
```

You will see a reporting screen, on that screemn you can find your personal tunneling URL like `Forwarding http://SOMETHING.ngrok.com -> 127.0.0.1:9292`.

So the other student can connect to your netcat server via

```sh
$ curl -vv http://SOMETHING.ngrok.com
```

Yay! :tada:
