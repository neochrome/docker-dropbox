FROM odise/busybox-python:stable
MAINTAINER Johan Stenqvist <johan@stenqvist.net>
LABEL Description="Dockerized dropbox"

RUN curl -L "https://d1ilhw0800yew8.cloudfront.net/client/dropbox-lnx.x86_64-3.18.1.tar.gz" \
	| gunzip -c - | tar -xf - -C /tmp \
	&& mv /tmp/.dropbox-dist /opt/dropbox 
RUN mkdir -p /dropbox
ENV HOME /dropbox
CMD cd \
	&& mkdir -p .dropbox-dist \
	&& chmod -w .dropbox-dist \
	&& /opt/dropbox/dropboxd
