FROM ubuntu:bionic

RUN apt-get update && apt-get install -y git wget tar fish

ENV version 2019.3.1

RUN wget https://download.jetbrains.com/go/goland-${version}.tar.gz &&\
    tar -xzf goland-${version}.tar.gz && rm -f goland-${version}.tar.gz


CMD goland-${version}/bin/goland.sh
