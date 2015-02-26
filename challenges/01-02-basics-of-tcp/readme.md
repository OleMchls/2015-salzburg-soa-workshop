# Challenge 01-02 - Basic TCP

This introductory challenge makes you play around with TCP. Other than other challenges it comes with a ready to run implementation.

We build upon the non-blocking concepts introduced by the [UDP Basics](../01-01-basics-of-udp) challenge and adds a new *Server Connection* object that makes it easier to handle multiple connections to a single server.

Make sure to have a look at the [spec/integration_spec.rb](spec/integration_spec.rb) spec to see how the testing is done and then run the tests in your vagrant box.

# Setup

```sh
$ bundle install
```

# Test / Compliance

Run

```sh
$ bundle exec rspec
```
