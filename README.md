# ilab-docker

ilab-docker creates a docker image that simulates the iLab machines so that
students can develop locally on any system and run their code in a docker
container.

This is particularly useful for student assignments using C where the libraries
are dependent on the somewhat dated RHEL6 libraries.

## How it works

There are 2 docker images defined based on the same root OS as the iLabs:
* wlynch/ilab:latest - This defines a minimal dev environment that should have
  everything a student needs to compile and debug C programs. Estimated size:
	~780 MB.
* wlynch/ilab:full - This defines a more comprehensive environment based on
  the installed packages of the iLabs. This is probably overkill for most
	assignments, but it will include libraries that the min image	may not have.
	Estimated size: 2.9 GB.

The `ilab` tool will mount your current working directory on your host machine
and run whatever command you give it in the docker container. This makes it
very simple to develop assignments that might be dependent on system libraries
or architectures that the iLab has.

Note: These images are not perfect replicas of the iLabs. There will be some
differences. They should use the same libraries for the most part though, so
code that runs on the container should also run on the iLabs.

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

### Advanced Usage

In the end, all the `ilab` script does is wrap `docker run`. Use the `docker`
tool directly if you want more control over the execution of your code.

You can pass in `-u root` to the docker tool to get root access to the
container, and from there you can do whatever you want.

## Requests & Contributions

Issues and PR are welcome.

## FAQ
> Why can't I run [insert program here]?

This probably means that the package is either missing, or the configuration of
some packages differs slightly from the real iLabs.

In some cases where the program/utility is non-trivial to install and is easily
available cross-platform (e.g. Python 2.7/3, Oracle JDK), I was lazy and
didn't include them. I may or may not get around to them eventually, but
otherwise just use your local environment to compliment this tool.
