FROM debian:stretch
LABEL maintainer="Yeahreum Developers <dev@yeahreum.org>"
LABEL description="Dockerised YeahreumCore, built from Travis"

RUN apt-get update && apt-get -y upgrade && apt-get clean && rm -fr /var/cache/apt/*

COPY bin/* /usr/bin/
