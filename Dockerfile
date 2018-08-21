FROM intra/centos7_base
LABEL maintainer="Rainer Hörbe <r2h2@hoerbe.at>"

RUN yum -y update \
 && yum -y install epel-release \
 && yum -y install curl git ip lsof net-tools openssl tar unzip which \
 && yum -y install python34-devel \
 && yum clean all && rm -rf /var/cache/yum \
 && ln -sf /usr/bin/python3.4 /usr/bin/python3 \
 && curl https://bootstrap.pypa.io/get-pip.py | /usr/bin/python3 \
 && mkdir -p /root/.config/pip \
 && printf "[global]\ndisable-pip-version-check = True\n" > /root/.config/pip/pip.conf

ARG TIMEZONE='Europe/Vienna'
RUN ln -sf /usr/share/zoneinfo/$TIMEZONE /etc/localtime
