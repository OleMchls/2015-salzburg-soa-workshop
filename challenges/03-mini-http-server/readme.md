# Challenge 03 - Mini HTTP Server / Client

This time your challenge is to write a little HTTP server which responds to every (valid) HTTP/1.1 request (ignore the request body!).

When you are done with that write a little HTTP client which which can be used to fetch any valid HTTP ressource.

# Setup

```sh
$ bundle install
```

# Development

## The Server

Your challenge is to write a mini HTTP server, which responds a simple `<h1>Ok</h1>` to every request it receives.

*NOTE: in order to simplify this: ignore the http request body*

Change the code in `lib/server.rb` to solve the challenge. You can run curl at all time against your server to test it

```sh
# run from within the challenges/03-mini-http-server folder
$ curl -vv http://localhost:9292/
```

## The Client

In this challenge you should write a simple HTTP client, which can fetch and parse the HTTP response form any web server.

Change the code in `lib/client.rb` to solve the challenge.

# Test / Compliance

Start your webserver `bundle exec ruby lib/server.rb` and run the test

```sh
$ bundle exec rspec spec/
```

to check if your app complies with all the challenge's rules. Yay! :tada:
