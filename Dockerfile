FROM debian:wheezy
MAINTAINER gaoal "keepob@163.com"

ADD sources.list  /etc/apt/sources.list
ADD run.sh /run.sh
RUN apt-get update && \
    apt-get -yq install openssh-server vim && \
    rm -rf /var/lib/apt/lists/*
    
RUN mkdir -p /var/run/sshd && \
    chmod 755 /run.sh && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
    
ENV ROOT_PASS=123456
    
VOLUME  ["/root/data"]

EXPOSE 22
CMD ["/run.sh"]
