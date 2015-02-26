# Challenge 05 - Add Redirects

Make your [custom HTTP client](../03-mini-http-server/lib/client.rb) automatically follow redirects.

# Setup

```sh
$ bundle install
```

# Development

1. Copy the Sinatra [test server](../04-test-your-client/lib/test_server) to ``lib``
2. Make sure the ``/hello`` routes redirects to ``/hello/salzburg`` instead of returning a string
3. Copy your [custom http client](../03-mini-http-server/lib/client.rb) to ``lib/client.rb``
4. Make the client follow redirects
5. Run the specs

# Test / Compliance

Run

```sh
$ bundle exec rspec
```

to check if your app complies with all the challenge's rules. Yay! :tada:
