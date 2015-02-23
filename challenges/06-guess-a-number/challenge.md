# Challenge 06 - Guess a number

This is a server based number guessing game. The [server](lib/number_server.rb) has a very simple HTTP API with just two endpoints, one to set a number and a second one to guess the number.

### **PUT** to ``/number``

Body: A number (e.g.: ``42``)

Send any number as the request body. The server will respond with status code ``200`` and the just set number as the response body.

If the server returns with anything but status code ``200`` an error has occurred.

**This endpoint must be called first.**

### **GET** to ``/number/123``

Where ``123`` can be any number.

The server responds with 3 different status codes:

* ``200`` if you have guessed the number correctly
* ``410`` if the number you just guessed was too low
* ``411`` if the number you just guessed was too high

The response body is empty.

If the server returns with anything but status code ``200``, ``410`` or ``411`` an error has occurred.

## Your challenge

Make sure to edit (guess_a_number_client.rb)[lib/guess_a_number_client.rb] in a way that the outlined methods actually talk to the server over HTTP. Feel free to reuse any code from your prior custom HTTP clients.

**Caveat 1:** Please note that when you send a request body it is **NOT** terminated by a ``\r\n`` or even a new line. Therefore make sure you do not use ``socket.puts`` but ``socket.write`` for sending the request body data to the server.

**Caveat 2:** You must send a ``Content-Length`` header when sending a request body. Get the byte length of a string with ``"schalala".bytes.length``.

# Setup

```sh
$ bundle install
```

# Development

Change the code in ``lib/guess_a_number.rb`` to solve the challenge.

You can run a webserver that runs your app at all times with

```sh
# run from within the challenges/06-guess-a-number folder
$ bundle exec rackup -o 0.0.0.0 -p 9292
```

This will spawn a web server that you can reach at: http://localhost:9292

You can stop the web server with *Ctrl+C*.

# Test / Compliance

Run

```sh
$ bundle exec rake
```

to check if your app complies with all the challenge's rules. Yay! :tada:
