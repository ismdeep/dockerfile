#!/bin/bash
apt-get update
apt-get upgrade -y
apt-get install -y apt-utils
apt-get install -y htop xz-utils wget curl git locales openssh-server vim zip
apt-get install -y gcc g++ make cmake unzip zlibc zlib1g-dev
apt-get install -y nginx
apt-get install -y mysql-server-5.7
apt-get install -y php-fpm php-mysql php-zip php-xml php-gd php-mbstring
apt-get install -y supervisor
cd /root && curl -sS https://getcomposer.org/installer -o composer-setup.php && php composer-setup.php --install-dir=/usr/local/bin --filename=composer && rm composer-setup.php
locale-gen en_US.UTF-8
