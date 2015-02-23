# Challenge 04 - Test your custom HTTP client

Use [Sinatra](http://www.sinatrarb.com/) to build a simple [test server](lib/test_server.rb) for your client. The server should respond to:

* ``/hello`` which should return the simple string ``World``
* ``/hello/salzburg`` which should return the simple string ``Servus!``

The spec automatically fires up your server and runs [your client](../03-mini-http-server/lib/client.rb) against this server.

# Setup

```sh
$ bundle install
```

# Development

Change the code in ``lib/test_server.rb`` to solve the challenge.

You can run a webserver that runs your app at all times with

```sh
# run from within the challenges/04-test-your-client folder
$ bundle exec rackup -o 0.0.0.0
```

This will spawn a web server that you can reach at: http://localhost:9292

You can stop the web server with *Ctrl+C*.

# Test / Compliance

Run

```sh
$ bundle exec rake
```

to check if your app complies with all the challenge's rules. Yay! :tada:
