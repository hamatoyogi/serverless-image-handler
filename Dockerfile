FROM centos/python-27-centos7
USER root

ENV LD_LIBRARY_PATH=/opt/rh/python27/root/usr/lib64
RUN yum install -y epel-release && yum groupinstall -y 'development tools'
RUN yum install -y zlib-dev openssl-devel sqlite-devel bzip2-devel xz-libs wget openssl yum-utils

WORKDIR /build

RUN yum-config-manager --enable epel
RUN yum -y install git python-pip autoconf make libpng-devel libcurl-devel gcc python-devel libjpeg-devel autoconf nasm sudo yum-config-manager python-virtualenv
RUN yum -y install jbigkit-libs optipng pngcrush gifsicle 'libjpeg*' pngquant ImageMagick-devel

ENV PYCURL_SSL_LIBRARY=openssl
RUN pip install pycurl
RUN yum -y reinstall perl-libs perl-*


