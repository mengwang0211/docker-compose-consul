FROM centos:7
ARG CONSUL_VERSION=1.4.2
ARG CONSUL_TEMPLATE_VERSION=0.19.5
ADD http://pnj2r604w.bkt.clouddn.com/consul_${CONSUL_VERSION}_linux_amd64.zip /tmp/consul.zip
ADD http://pnj2r604w.bkt.clouddn.com/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip /tmp/consul-template.zip

RUN  yum -y install unzip \
  && unzip /tmp/consul.zip -d /usr/local/bin \
  && chmod +x /usr/local/bin/consul \ 
  && rm /tmp/consul.zip \
  && unzip /tmp/consul-template.zip -d /usr/local/bin \
  && chmod +x /usr/local/bin/consul-template \ 
  && rm /tmp/consul-template.zip

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 53/udp
