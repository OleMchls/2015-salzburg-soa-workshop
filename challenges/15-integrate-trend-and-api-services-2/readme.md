# Challenge 15 - Integrate Trend and API Services 2

In this challenge it's your task to integrate the complementary color service again. But this time, you should try a different integration strategy. This time you should make the frontend ui server to fetch the colors and the matching complementary colors and render them accordingly.

We will discuss the differences of both integration strategies afterwards.

You can just re-use the *complementary color service* from *Challenge 13* and the *color api* from *Challenge 11* there shouldn't be any more adjustments.

# Setup

```sh
$ bundle install
```

Copy the ui service you have written in *Challenge 12* into the `app` folder.

# Development

Change the code in `spec/color_ui_spec.rb` line `11` to return your Rack based application and solve the challenge.

You can use whatever rack-based framework you like. And whatever folder structure you like.

# Test / Compliance

Run

```sh
$ bundle exec rspec spec/
```

to check if your app complies with all the challenge's rules. Yay! :tada:
