# Challenge 10-01 - Rack Basics

Build a pure [Rack](http://rack.github.io/) app that responds to HTTP requests with a HTTP status code ``200`` and the body: ``Hello World``.

# Setup

```sh
$ bundle install
```

# Development

Change the code in ``lib/app.rb`` to solve the challenge.

You can run a webserver that runs your app at all times with

```sh
# run from within the challenges/10-01-rack-basics folder
$ bundle exec rackup -o 0.0.0.0
```

This will spawn a web server that you can reach at: http://localhost:9292

You can stop the web server with *Ctrl+C*.

# Test / Compliance

Run

```sh
$ bundle exec rspec
```

to check if your app complies with all the challenge's rules. Yay! :tada:
