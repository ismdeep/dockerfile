FROM ubuntu:18.04

MAINTAINER ismdeep <ismdeep@protonmail.com>

RUN mkdir -p /data
RUN apt-get update -y
RUN apt-get install -y apt-utils xz-utils wget curl git python2.7 make gcc locales

# RUN dpkg-reconfigure locales
RUN locale-gen en_US.UTF-8

# Download node
ADD https://nodejs.org/dist/v12.18.4/node-v12.18.4-linux-x64.tar.xz /data
RUN cd /data && xz -d node-v12.18.4-linux-x64.tar.xz && tar -xvf node-v12.18.4-linux-x64.tar && rm node-v12.18.4-linux-x64.tar

# Clone c9sdk
RUN cd /data && git clone https://github.com/c9/core.git c9sdk

# Run preinstall
RUN cd /data/c9sdk && export PATH=$PATH:/data/node-v12.18.4-linux-x64/bin && scripts/install-sdk.sh

RUN mkdir -p /workspace
ADD server-start.sh /data
EXPOSE 80
ENTRYPOINT ["/bin/bash", "/data/server-start.sh"]
