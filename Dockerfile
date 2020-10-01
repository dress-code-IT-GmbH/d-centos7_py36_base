FROM intra/centos7_base
LABEL maintainer="Dress code IT Gmbh <office@dress-code.biz>"

RUN yum update

RUN yum -y install epel-release \
 && yum -y install curl git ip lsof net-tools openssl tar unzip which \
 # && yum -y install https://centos7.iuscommunity.org/ius-release.rpm \
 # && yum -y install python36u python36u-pip \
 && yum -y install python36 python36-libs python36-devel python36-pip \
 && yum clean all && rm -rf /var/cache/yum \
 && ln -sf /usr/bin/python3.6 /usr/bin/python3 \
 && python3 -m pip install --upgrade pip \
 && mkdir -p /root/.config/pip \
 && printf "[global]\ndisable-pip-version-check = True\n" > /root/.config/pip/pip.conf

ARG TIMEZONE='Europe/Vienna'
RUN ln -sf /usr/share/zoneinfo/$TIMEZONE /etc/localtime
