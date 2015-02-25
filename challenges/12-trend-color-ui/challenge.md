# Challenge 12 - Trend Color UI

Now it's your task to write a web layer, which displays the data from the API. In order to separate the application logic from the display logic.

Something like this.

![](http://cl.ly/image/47141x2D1I0K/Screen%20Shot%202015-02-17%20at%2000.23.21.png)

# Setup

```sh
$ bundle install
```

# Development

Change the code in [lib/trend_colors_ui.rb](lib/trend_colors_ui.rb) to make the UI work. We've already put a view together that Sinatra will use with ``erb :index``. To make that view display the colors make sure to assign the retrieved and parsed array of colors to ``@colors`` in your Sinatra app.

There also is a client for your colors api in [lib/trend_colors_client.rb](lib/trend_colors_client.rb). You can use it to query the colors API like this:

```ruby
TrendColorsClient.get("/colors/trends/2013")
```

To parse JSON strings in your Sinatra app require the JSON library first with: ``require 'json'`` and then use: ``JSON.parse('[{"key": "value"}]')``.

# Test / Compliance

Run

```sh
$ bundle exec rspec spec
```

to check if your app complies with all the challenge's rules. Yay! :tada:
