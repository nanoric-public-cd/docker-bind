# volumes:
# /etc/named.conf
# /var/bind/ or /var/named/ (linked)
# ports:
# 53/udp
# 53/tcp

FROM alpine

MAINTAINER 475647575@qq.com

USER root

RUN apk add bind
RUN ln -s /etc/named.conf /etc/bind/named.conf
RUN ln -s /var/bind /var/named

EXPOSE 53:53/udp
EXPOSE 53:53/tcp

CMD sh -c "named-checkconf /etc/named.conf && named -f -u named -c /etc/named.conf"
