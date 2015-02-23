# Challenge 01-03 - Compare TCP and UDP

Compare the speed and reliability of TCP and UDP.

The [spec/comparison_spec.rb](spec/comparison_spec.rb) comes with a spec that compares the speed of sending 10.000 packtes over a UDP or TCP socket. It also logs the percentage of packets received as a measure of quality.

Make sure to play around with the spec and test different scenarios. Start with the "local" one that the specs supports out-of-the box. After that try to run the spec across a real network.

# Setup

```sh
$ bundle install
```

# Test / Compliance

Run

```sh
$ bundle exec rspec
```
