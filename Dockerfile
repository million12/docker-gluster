FROM million12/centos-supervisor
MAINTAINER Marcin Ryzycki marcin@m12.io, Przemyslaw Ozgo linux@ozgo.info

RUN \
    yum update -y && \
    yum install -y epel-release && \
    yum remove -y fakesystemd && \
    yum install -y systemd wget bind-utils && \
    cd /tmp/ && \
    wget -l 1 -nd -nc -r -A.rpm http://download.gluster.org/pub/gluster/glusterfs/LATEST/RHEL/epel-7/x86_64/ && \
    yum install -y gluster* && \
    rm -f gluster* && \
    yum clean all

COPY container-files /
