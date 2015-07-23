# This file sets up a basic environment to simulate the C environment used on
# the iLab Machines.
FROM centos:centos6
MAINTAINER Billy Lynch <billy@wlyn.ch>

# Install Package Groups
RUN yum -y groupinstall "Development Tools" "Debugging Tools"

# Add local user
RUN adduser -m -U -u 1000 dev

USER dev
WORKDIR /home/dev
CMD /bin/bash
