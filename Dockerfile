FROM centos:7

RUN yum clean all -y && \
    rm -rf /var/cache/yum/* && \
    yum makecache -y
    
    
RUN yum update -y && \
    yum install -y openssl && \
    yum install -y curl && \
    yum clean all -y

RUN mkdir -p /opt

WORKDIR /opt

RUN curl -o splunk-9.0.2-17e00c557dc1-Linux-x86_64.tgz https://download.splunk.com/products/splunk/releases/9.0.2/linux/splunk-9.0.2-17e00c557dc1-Linux-x86_64.tgz
RUN tar xvzf splunk-9.0.2-17e00c557dc1-Linux-x86_64.tgz

RUN chmod -R 777 /opt/splunk \
    && chmod 777 /etc/password

ENTRYPOINT /opt/splunk/bin/splunk start --accept-license --no-prompt
