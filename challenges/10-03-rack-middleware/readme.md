# Challenge 10-01 - Rack Basics

We have put a very basic Sinatra app in [lib/app.rb](lib/app.rb).

Write a Rack middleware that ensures that only authorized people can access that app with [HTTP Basic Auth](http://en.wikipedia.org/wiki/Basic_access_authentication).

The super secret username and password are:

* Username: alfred
* Password: hitchcock

A request without the ``Authorization`` header set must result in a status code 401.

A request with the ``Authorization`` header set but with wrong credentials must resulst in a status code 403. 

# Setup

```sh
$ bundle install
```

# Development

Change the code in ``lib/middleware.rb`` to solve the challenge.

Base 64 is easily decoded in Ruby like this:

```ruby
require 'base64'
Base64.decode64('QWxhZGRpbjpvcGVuIHNlc2FtZQ==') # => "Aladdin:open sesame"
```

You can run a webserver that runs your app at all times with

```sh
# run from within the challenges/10-03-rack-middleware folder
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
