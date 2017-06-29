# Pull base image
#FROM centos:centos7.3.1611
#FROM centos:centos7.2.1511
FROM centos:centos7
# FROM hub.c.163.com/public/centos:7.2.1511

MAINTAINER bhybj1987 "bhybj1987@126.com"

# update source
COPY ./yum_repo/CentOS7-Base-bhy.repo /etc/yum.repos.d/CentOS-Base.repo
RUN useradd work && \
yum install -y ftp && \
yum install -y wget && \
yum install -y svn && \
yum install -y git && \
yum install -y vim && \
yum install -y ctags && \
yum install -y tar && \
yum install -y telnet && \
yum install -y tcpdump && \
yum install -y iptables && \
yum install -y bzip2 && \
yum install -y lsof && \
yum install -y ack && \
yum install -y sudo && \
yum install -y php70w php70w-opcache php70w-fpm && \
yum install -y gcc gcc-c++ && \
yum install -y golang && \
yum clean all && \
/bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
echo 'Asia/Shanghai' >/etc/timezone

# yum install -y yum-plugin-ovl || true && \
# yum install -y vim tar wget curl rsync bzip2 iptables tcpdump less telnet net-tools lsof sysstat cronie python-setuptools && \

VOLUME ["/home/work"]

CMD ["/bin/bash"]
# Define default command.
# ENTRYPOINT /bin/bash
