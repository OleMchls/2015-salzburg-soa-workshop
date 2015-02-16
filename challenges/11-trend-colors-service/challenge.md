# Challenge 11 - Write a trend colors API

In this challenge you should write a API which returns the trend colors by year.

This API will be used in a few challenges later, so make sure to make the tests pass here!

Here are the (some what fake) trend colors:

## 2013 Trend Colors

|   name    | hexcode |
|-----------|---------|
| Tangerine | #F79256 |
| Custard   | #EAD98B |
| Marsala   | #955251 |

## 2014 Trend Colors

|      name      | hexcode |
|----------------|---------|
| Classic Blue   | #1D4E89 |
| Toasted Almond | #D2B29A |
| Strawberry Ice | #E3868F |

## 2015 Trend Colors

|      name     | hexcode |
|---------------|---------|
| Aquamarine    | #9DC6D8 |
| Scuba Blue    | #00B2CA |
| Lucite® Green | #7DCFB6 |

# Setup

```sh
$ bundle install
```

# Development

Change the code in `spec/color_server_spec.rb` line `11` to return your Rack based application and solve the challenge.

You can use whatever rack-based framework you like. And whatever folder structure you like.

# Test / Compliance

Run

```sh
$ bundle exec rspec spec
```

to check if your app complies with all the challenge's rules. Yay! :tada:
