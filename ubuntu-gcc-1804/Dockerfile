FROM ubuntu:18.04

MAINTAINER L. Jiang <l.jiang.1024@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

ADD authorized_keys /root/.ssh/authorized_keys
RUN apt update && apt install -y rsync gcc g++ make cmake gdb git openssh-server supervisor

EXPOSE 22
COPY supervisord.conf /etc/supervisord.conf
CMD ["/usr/bin/supervisord"]