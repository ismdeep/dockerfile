FROM alpine

MAINTAINER L. Jiang <l.jiang.1024@gmail.com>

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories
RUN apk update && apk add --no-cache openssh-keygen
