### Dockerized muscle
# use the dockerfile/ubuntu base image provided by https://index.docker.io/u/dockerfile/ubuntu/
# The environment is ubuntu-14.04
FROM dockerfile/python

MAINTAINER David Weng weng@email.arizona.edu
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

### get the lib that needed for compiling
## Step 1: Install the basic tools to set up the environment.
# Install the wget, gcc, make tools, handling the lib dependency problem.
RUN apt-get install -y wget
RUN apt-get install -y gcc g++
RUN apt-get install -y make

## Step 2: Install the binary file instead of configure, make and make install because that would cause a series of library dependency problems. Never try to do that.
WORKDIR /home/vagrant
RUN wget http://www.drive5.com/muscle/downloads3.8.31/muscle3.8.31_i86linux64.tar.gz
RUN tar xvzf muscle3.8.31_i86linux64.tar.gz

## Step 3: Set the executable as an Entrypoint 
#ENV PATH /home/vagrant/muscle3.8.31_i86linux64:$PATH
ENTRYPOINT ["/home/vagrant/muscle3.8.31_i86linux64"]
