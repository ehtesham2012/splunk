FROM centos:7

RUN mkdir -p /opt/splunk

RUN curl -o splunk-9.0.2-17e00c557dc1-Linux-x86_64.tgz https://download.splunk.com/products/splunk/releases/9.0.2/linux/splunk-9.0.2-17e00c557dc1-Linux-x86_64.tgz
RUN tar xvzf splunk-9.0.2-17e00c557dc1-Linux-x86_64.tgz

ENTRYPOINT /opt/splunk
