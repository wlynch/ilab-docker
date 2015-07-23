FROM centos:centos6
MAINTAINER Billy Lynch <billy@wlyn.ch>

# Install Package Groups
ADD config/base-groups.txt /
RUN yum -y groupinstall $(cat base-groups.txt | egrep -v "^\s*(#|$)") && rm base-groups.txt

# Install Base Packages
ADD config/base-rpm.txt /
RUN yum -y install $(cat base-rpm.txt | egrep -v "^\s*(#|$)") && rm base-rpm.txt

# Install EPEL
ADD https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm /
RUN yum -y install epel-release-latest-6.noarch.rpm && rm epel-release-latest-6.noarch.rpm

# Install EPEL Packages
ADD config/epel.txt /
RUN yum -y install $(cat epel.txt | egrep -v "^\s*(#|$)") && rm epel.txt

CMD /bin/bash
