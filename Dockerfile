FROM intra/centos7_base
LABEL maintainer="Rainer Hörbe <r2h2@hoerbe.at>"

RUN yum -y install epel-release \
 && yum -y install curl git ip lsof net-tools openssl tar unzip which \
 && yum -y install https://centos7.iuscommunity.org/ius-release.rpm \
 && yum -y install python36u python36u-pip \
 && ln -s /usr/bin/python3.6 /usr/bin/python3 \
 && ln -s /usr/bin/pip3.6 /usr/bin/pip3 \
 && yum clean all && rm -rf /var/cache/yum \
 && mkdir -p /root/.config/pip \
 && printf "[global]\ndisable-pip-version-check = True\n" > /root/.config/pip/pip.conf

ARG TIMEZONE='Europe/Vienna'
RUN ln -sf /usr/share/zoneinfo/$TIMEZONE /etc/localtime
