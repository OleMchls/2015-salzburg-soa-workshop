# Challenge 07 - "FTP" over REST

Our goal is to write a REST API that allows some simple file handling in a given file sandbox on the servers file system.

The API is very straight forward:

### **GET** to ``/some/path/my_file.txt``

Reads that file and responds with the content of the file as the response body.

Responds with status code 200 if the file exists. Responds with 404 if the file does not exist.

### **GET** to ``/some/path``

If ``/some/path`` is a directory it responds with a list of the files and directories in that directory delimited by ``\r\n``. It's like the command line tool ``ls`` or ``dir``.

Responds with status code 200 if the directory exists. Responds with 404 if the directory does not exist.

### **PUT** to ``/some/path/my_file.txt``

Writes the request body to that file.

Responds with status code 200.

### **DELETE** to ``/some/path/my_file.txt``

Deletes that file.

Responds with status code 200 if the file exists. Responds with 404 if the file does not exist.

## The Client

[Here](lib/file_client.rb) is a fully working client for that API.

## The Server

It is your job to expand [the server](lib/file_server.rb) to make all specs pass.

# Setup

```sh
$ bundle install
```

# Development

The files should all go to: [./files](files)

### Important docs:

**Sinatra:** [http://www.sinatrarb.com/intro.html](http://www.sinatrarb.com/intro.html)
**Basic file operations:** [http://ruby-doc.org//core-2.2.0/File.html](http://ruby-doc.org//core-2.2.0/File.html)
**Advanced file operations:** [http://ruby-doc.org/stdlib-2.2.0/libdoc/fileutils/rdoc/FileUtils.html](http://ruby-doc.org/stdlib-2.2.0/libdoc/fileutils/rdoc/FileUtils.html)

For that last one ``require 'fileutils'`` is your friend.

``request.env['PATH_INFO']`` in Sinatra give you the *path* of the request. So: ``/bla/blub`` for ``http://localhost:9292/bla/blub``.

Last but not least: ``Dir['/tmp/some/dir/*']`` returns an array of absolute path of all entries in that directory.

You can run the server with:

```sh
# run from within the challenges/07-rest-ftp folder
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
