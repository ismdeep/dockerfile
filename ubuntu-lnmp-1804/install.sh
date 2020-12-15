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
cd /root && curl -sSL https://github.com/composer/composer/releases/download/1.10.19/composer.phar -o composer && chmod +x composer && mv composer /usr/local/bin/composer
locale-gen en_US.UTF-8
