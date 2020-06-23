FROM ubuntu:18.04

MAINTAINER ismdeep <ismdeep@protonmail.com>

ENV DEBIAN_FRONTEND noninteractive

ADD sources.list /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y htop xz-utils wget curl git python2.7 locales openssh-server vim zip
RUN apt-get install -y gcc g++ make cmake unzip zlibc zlib1g-dev
RUN apt-get install -y nginx
RUN apt-get install -y mysql-server-5.7
RUN apt-get install -y php-fpm php-mysql php-zip php-xml php-gd
RUN apt-get install -y supervisor
# RUN mysql_secure_installation

# RUN dpkg-reconfigure locales
RUN locale-gen en_US.UTF-8

EXPOSE 22
EXPOSE 80
EXPOSE 443
EXPOSE 3306

COPY supervisord.conf /etc/supervisord.conf

CMD ["/usr/bin/supervisord"]

