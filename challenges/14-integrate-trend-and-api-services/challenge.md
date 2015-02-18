# Challenge 14 - Integrate Trend and API Services

In this challenge it's your task to extend the trend color api to also fetch the complement color and return it. And display the results in the web frontend.

You can just re-use the *complementary color service* from *Challenge 13* there shouldn't be any more adjustments.

# Setup

```sh
$ bundle install
```

Copy the api server you have written in *Challenge 11* into the `app/api` folder and the web frontend you've written in *Challenge 12* into `app/web`.

# Development

Change the code in `spec_api/color_server_spec.rb` line `11` and `spec_web/color_ui_spec.rb` line `11` to return your Rack based application and solve the challenge.

You can use whatever rack-based framework you like. And whatever folder structure you like.

# Test / Compliance

Run

```sh
$ bundle exec rspec spec_web/ && bundle exec rspec spec_api/
```

to check if your app complies with all the challenge's rules. Yay! :tada:
