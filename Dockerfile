FROM debian:wheezy
MAINTAINER gaoal "keepob@163.com"

ADD sources.list  /etc/apt/sources.list
RUN apt-get update && \
    apt-get -yq install openssh-server vim && \
    rm -rf /var/lib/apt/lists/*
    
RUN mkdir -p /var/run/sshd &&\
    echo "root:123456" | chpasswd &&\
    mkdir -p /root/data
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
    
VOLUME  ["/root/data"]

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
