# Challenge 08 - REST File Server using HATEOAS

We built a small extension to our REST file server. It understands the HATEOAS principles and actually paginates directory listing with 10 files per page.

Your challenge is to adopt those changes in the [file client](lib/file_client.rb). The goal is to have the ``#read_directory`` method return a full directory listing again, not just the first page. Use the ``Link`` header the server is adding to the response to get the correct follow up paths (**attention**: the ``Link`` header uses absolute URLs so make sure to strip those down to relative paths when you use them). The server adds links with:

* ``rel="next"`` for the next page
* ``rel="prev"`` for the previous page
* ``rel="first"`` for the first page
* ``rel="last"`` for the last page

``next`` and ``previous`` are **not** added when there is no next or previous page.

# Setup

```sh
$ bundle install
```

# Development

Change the code in ``lib/file_client.rb`` to solve the challenge.

To make your life easier we have prepared a small library to parse the ``Link`` header. Use it like this:

```ruby
links = LinkHeader.parse('<https://api.github.com/users/steveklabnik/gists?page=2>; rel="next", <https://api.github.com/users/steveklabnik/gists?page=33333>; rel="last"')
links['next'].url # => 'https://api.github.com/users/steveklabnik/gists?page=2'
links['last'].url # => 'https://api.github.com/users/steveklabnik/gists?page=33333'
```

# Test / Compliance

Run

```sh
$ bundle exec rake
```

to check if your app complies with all the challenge's rules. Yay! :tada:
