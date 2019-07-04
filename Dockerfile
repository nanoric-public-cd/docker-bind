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

# Add some tools, make it easier to run test.
RUN yum -y install bind-utils

EXPOSE 53:53/udp
EXPOSE 53:53/tcp

CMD named-checkconf /etc/named.conf && named -f -u named -c /etc/named.conf
