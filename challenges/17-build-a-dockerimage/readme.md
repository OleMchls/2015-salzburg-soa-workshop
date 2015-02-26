# Challenge 17 - Build a Dockerimage from a Dockerfile

In this challenge you shoul write a Dockerfile and build the corresponding Dockerimage. Finally you should run your container in your box with a interactive shell.

- [ ] write `Dockerfile`
- [ ] build image from Dockerfile
- [ ] run command in container based on that image
- [ ] write a `fig.yml` and spin up your service with fig
- [ ] create a account at official docker registry and upload your image
- [ ] create deis account
- [ ] generate ssh-keys on your machine
- [ ] upload new keys to deis account
- [ ] move project into new folder and git-init it
- [ ] deploy the app to deis cluster

# Setup

```sh
$ docker pull ruby
```

# Development

Finish the [`Dockerfile`](Dockerfile) to solve the challenge.

You can run a webserver that runs your app at all times with

```sh
$ bundle exec rackup
```

# Test / Compliance

Unfortunatly there is no real way to test this.
