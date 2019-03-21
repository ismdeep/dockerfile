# base image
FROM hub.c.163.com/public/centos:7.2-tools

LABEL maintainer="ismdeep <ismdeep@protonmail.com>"

# MAINTAINER
MAINTAINER ismdeep@protonmail.com

RUN mkdir /data
ADD install-nginx-php.sh /data
RUN cat /data/install-nginx-php.sh | bash
RUN mkdir /var/log/supervisor
ADD supervisor-php.conf /etc/supervisor/conf.d/
ADD supervisor-nginx.conf /etc/supervisor/conf.d/

EXPOSE 80

CMD ["supervisord"]