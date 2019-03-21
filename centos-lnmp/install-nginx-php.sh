#!/bin/bash
# install php nginx on centos
# https://www.cnblogs.com/flywind/p/6019631.html
PHP_VERSION=5.6.40
LIBMCRYPT_VERSION=2.5.8
MHASH_VERSION=0.9.9.9
MCRYPT_VERSION=2.6.8

yum -y install gcc gcc-c++ automake autoconf libtool make wget
yum -y install libmcrypt-devel mhash-devel libxslt-devel \
libjpeg libjpeg-devel libpng libpng-devel freetype freetype-devel \
libxml2 libxml2-devel zlib zlib-devel glibc glibc-devel glib2 \
glib2-devel bzip2 bzip2-devel ncurses ncurses-devel curl curl-devel \
e2fsprogs e2fsprogs-devel krb5 krb5-devel libidn libidn-devel openssl openssl-devel
yum -y install epel-release
yum -y install axel

# install libmcrypt
cd /usr/local/src
axel -n 10 http://download.ismdeep.com/software/linux/centos-php-nginx-packages/libmcrypt-2.5.8.tar.gz
tar -zxvf libmcrypt-$LIBMCRYPT_VERSION.tar.gz
cd libmcrypt-$LIBMCRYPT_VERSION
./configure
make && make install
ln -s   /usr/local/bin/libmcrypt_config   /usr/bin/libmcrypt_config
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

# install mhash
cd /usr/local/src
axel -n 10 http://download.ismdeep.com/software/linux/centos-php-nginx-packages/mhash-$MHASH_VERSION.tar.gz
tar -zxvf mhash-$MHASH_VERSION.tar.gz
cd mhash-$MHASH_VERSION
./configure
make && make install

# install mcrypt
cd /usr/local/src
axel -n 10 http://download.ismdeep.com/software/linux/centos-php-nginx-packages/mcrypt-$MCRYPT_VERSION.tar.gz
tar -zxvf mcrypt-$MCRYPT_VERSION.tar.gz
cd mcrypt-$MCRYPT_VERSION
./configure
make && make install

# install PCRE
cd /usr/local/src
axel -n 10 http://download.ismdeep.com/software/linux/centos-php-nginx-packages/pcre-8.39.tar.gz
tar -zxvf pcre-8.39.tar.gz
cd pcre-8.39
./configure
make && make install

# install zlib
cd /usr/local/src
axel -n 10 http://download.ismdeep.com/software/linux/centos-php-nginx-packages/zlib-1.2.11.tar.gz
tar -zxvf zlib-1.2.11.tar.gz
cd zlib-1.2.11
./configure
make && make install

# install ssl
cd /usr/local/src
axel -n 10 http://download.ismdeep.com/software/linux/centos-php-nginx-packages/openssl-1.1.0b.tar.gz
tar -zxvf openssl-1.1.0b.tar.gz

# install nginx
cd /usr/local/src
axel -n 10 http://download.ismdeep.com/software/linux/centos-php-nginx-packages/nginx-1.15.8.tar.gz
tar -zxvf nginx-1.15.8.tar.gz
cd nginx-1.15.8

# add user and usergroup for nginx
groupadd -r nginx
useradd -r -g nginx nginx

# configure for nginx to install
./configure \
--prefix=/usr/local/nginx \
--sbin-path=/usr/local/nginx/sbin/nginx \
--conf-path=/usr/local/nginx/nginx.conf \
--pid-path=/usr/local/nginx/nginx.pid \
--user=nginx \
--group=nginx \
--with-http_ssl_module \
--with-http_flv_module \
--with-http_mp4_module  \
--with-http_stub_status_module \
--with-http_gzip_static_module \
--http-client-body-temp-path=/var/tmp/nginx/client/ \
--http-proxy-temp-path=/var/tmp/nginx/proxy/ \
--http-fastcgi-temp-path=/var/tmp/nginx/fcgi/ \
--http-uwsgi-temp-path=/var/tmp/nginx/uwsgi \
--http-scgi-temp-path=/var/tmp/nginx/scgi \
--with-pcre=/usr/local/src/pcre-8.39 \
--with-zlib=/usr/local/src/zlib-1.2.11 \
--with-openssl=/usr/local/src/openssl-1.1.0b
make && make install

# /usr/local/nginx
# install php and php-fpm
yum -y install gcc gcc-c++ glibc
yum -y install libmcrypt-devel mhash-devel \
libxslt-devel libjpeg libjpeg-devel libpng \
libpng-devel freetype freetype-devel libxml2 \
libxml2-devel zlib zlib-devel glibc glibc-devel \
glib2 glib2-devel bzip2 bzip2-devel ncurses ncurses-devel \
curl curl-devel e2fsprogs e2fsprogs-devel krb5 krb5-devel \
libidn libidn-devel openssl openssl-devel

yum -y install libxml2-devel openssl-devel curl-devel \
libjpeg-devel libpng-devel freetype-devel openldap-devel libmcrypt-devel

cd /usr/local/src
axel -n 10 http://download.ismdeep.com/software/linux/centos-php-nginx-packages/php-$PHP_VERSION.tar.gz
tar -zvxf php-$PHP_VERSION.tar.gz
cd php-$PHP_VERSION

# add /usr/local/lib in /etc/ld.so.conf.d/local.conf
echo /usr/local/lib >> /etc/ld.so.conf.d/local.conf

./configure --prefix=/usr/local/php  --enable-fpm --with-mcrypt \
--enable-mbstring --enable-pdo --with-curl --disable-debug  --disable-rpath \
--enable-inline-optimization --with-bz2  --with-zlib --enable-sockets \
--enable-sysvsem --enable-sysvshm --enable-pcntl --enable-mbregex \
--with-mhash --enable-zip --with-pcre-regex --with-mysql --with-mysqli \
--with-gd --with-jpeg-dir --with-freetype-dir --enable-calendar
make && make install
cp php.ini-production /usr/local/php/lib/php.ini
cd /usr/local/php
cp etc/php-fpm.conf.default etc/php-fpm.conf
# vim etc/php-fpm.conf
# user = www-data
# group = www-data
echo user = www-data >> /usr/local/php/etc/php-fpm.conf
echo group = www-data >> /usr/local/php/etc/php-fpm.conf

groupadd www-data
useradd -g www-data www-data

# /usr/local/php/sbin/php-fpm
mkdir -p /var/tmp/nginx/client
# /usr/local/nginx/sbin/nginx
