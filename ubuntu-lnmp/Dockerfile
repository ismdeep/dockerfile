FROM ubuntu:20.04

MAINTAINER ismdeep <ismdeep@protonmail.com>

ENV DEBIAN_FRONTEND noninteractive

ADD sources.list /etc/apt/sources.list
ADD install.sh /install.sh
RUN bash /install.sh

EXPOSE 22
EXPOSE 80
EXPOSE 443
EXPOSE 3306
COPY supervisord.conf /etc/supervisord.conf
CMD ["/usr/bin/supervisord"]