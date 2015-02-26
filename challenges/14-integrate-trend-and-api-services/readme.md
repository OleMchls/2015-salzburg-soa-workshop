# Challenge 14 - Integrate Trend and API Services

In this challenge it's your task to extend the trend color api to also fetch the complement color and return it. And display the results in the web frontend.

You can just re-use the *complementary color service* from *Challenge 13* there shouldn't be any more adjustments.

# Setup

```sh
$ bundle install
```

Copy the api server you have written in *Challenge 11* into the `app/api` folder and the web frontend you've written in *Challenge 12* into `app/web`.

# Development

Run the servers:

**Color Web UI:** Port 9292
**Trend Color API**: Port 9393
**Complement Color API**: Port 9494

Run the complement color api from challenge 13's folder.

Run the trend color API with:

```sh
rackup -o 0.0.0.0 -p 9393 config.api.ru
```

Run the trend color web UI with:

```sh
rackup -o 0.0.0.0 -p 9393 config.ui.ru
``

There also is the new [lib/complement_colors_client.rb](lib/complement_colors_client.rb) to be used in the same way as [lib/trend_colors_client.rb](lib/trend_colors_client.rb).

# Test / Compliance

Run

```sh
$ bundle exec rspec
```

to check if your app complies with all the challenge's rules. Yay! :tada:
