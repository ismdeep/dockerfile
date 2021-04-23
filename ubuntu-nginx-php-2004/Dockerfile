FROM ubuntu:20.04

MAINTAINER L. Jiang <l.jiang.1024@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

ADD sources.list /etc/apt/sources.list
ADD install.sh /install.sh
RUN bash /install.sh

EXPOSE 80
COPY supervisord.conf /etc/supervisord.conf
CMD ["/usr/bin/supervisord"]