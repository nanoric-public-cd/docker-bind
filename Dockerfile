# volumes:
# /etc/named.conf
# /var/named/
# ports:
# 53/udp
# 53/tcp

FROM centos

MAINTAINER 475647575@qq.com

USER root

RUN yum -y install bind
RUN yum -y install bind-utils
RUN yum clean all
RUN mv /etc/named.conf /var/named/

EXPOSE 53:53/udp
EXPOSE 53:53/tcp

CMD named-checkconf /var/named/named.conf && named -f -u named -c /var/named/named.conf
