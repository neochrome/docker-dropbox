FROM odise/busybox-python:stable
MAINTAINER Johan Stenqvist <johan@stenqvist.net>
LABEL Description="Dockerized dropbox"

RUN curl -L "https://www.dropbox.com/download?plat=lnx.x86_64" \
	| gunzip -c - | tar -xf - -C /tmp \
	&& mv /tmp/.dropbox-dist /opt/dropbox \
  && curl -L "https://www.dropbox.com/download?dl=packages/dropbox.py" \
	| sed 's|#!/usr/bin/python|#!/bin/python|' > /opt/dropbox/dropbox \
	&& chmod +x /opt/dropbox/dropbox \
	&& mkdir -p /dropbox

ENV PATH $PATH:/opt/dropbox
ENV HOME /dropbox
