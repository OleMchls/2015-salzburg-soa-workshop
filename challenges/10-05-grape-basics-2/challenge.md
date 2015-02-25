# Challenge 10-05 - Grape Basics 2

Your job is to re-write the known FTP REST server using Grape.

You can copy all the file handling logic from your own server from challenge 07 or from our server from challenge 08. If you use our version note that most of the Sinatra functionality can be found in Grape, too.

**Caveat:** The syntac for wildcard routes in Grape is: ``get '/*file' do`` you then can access the wildcard parameter with ``params[:file]``

# Setup

```sh
$ bundle install
```

# Development

Change the code in ``lib/file_server.rb`` to solve the challenge.

You can run a webserver that runs your app at all times with

```sh
# run from within the challenges/10-05 folder
$ bundle exec rackup -o 0.0.0.0
```

This will spawn a web server that you can reach at: http://localhost:9292

You can stop the web server with *Ctrl+C*.

# Test / Compliance

Run

```sh
$ bundle exec rspec
```

to check if your app complies with all the challenge's rules. Yay! :tada:
