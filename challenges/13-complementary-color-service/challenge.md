# Challenge 13 - Complementary Color API

In this Challenge it's your task to develop a API which returns the complementary color for a given color. We will need this service in the next Challenges.

Hint: You can find the gem [palenta](https://github.com/jordanstephens/paleta) in the `Gemfile` so you don't have to deal with the actual implementation of calculating the complementary colors.

# Setup

```sh
$ bundle install
```

# Development
Change the code in `spec/complementary_color_server_spec.rb` line `11` to return your Rack based application and solve the challenge.

You can use whatever rack-based framework you like. And whatever folder structure you like.

# Test / Compliance

Run

```sh
$ bundle exec rspec spec/
```

to check if your app complies with all the challenge's rules. Yay! :tada:
