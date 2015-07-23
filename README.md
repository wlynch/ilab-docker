# ilab-docker

ilab-docker creates a docker image that simulates the iLab machines so that
students can develop locally on any system and run their code in a docker
container.

This is particularly useful for student assignments using C where the libraries
are dependent on the somewhat dated RHEL6 libraries.

## Installation

### Docker

See the [Docker documentation](https://docs.docker.com/installation/).

### ilab-docker

As long as you have everything set up, Docker should handle the fetching
of the image automatically. The only thing you might want to do is add the ilab
script to your path.

## Usage

WARNING: The `ilab` script will mount your host machine's current working
directory as the working directory of your container. This has the benefit
of being able to make immediate changes to your work and have them apply
immediately to your container instance. However, this is a two-way street
so changes made by the container will be reflected on the host machine.

### Single Commands

To run a single command, run the `ilab` command from your working directory.
```shell
$ ls
Makefile hello.c
$ ilab make
gcc hello.c -o hello_world
$ ilab hello_world
Hello world!
```

### Shell

If you want an interactive session, simply pass no arguments to the `ilab`
command, and you will be dropped into a bash shell with your current working
directory mounted as the dev user's home directory.

## Requests & Contributions

Issues and PR are welcome.
