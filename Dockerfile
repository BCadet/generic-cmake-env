FROM ubuntu:20.04 as generic-cmake-env

LABEL maintainer="BCadet <https://github.com/BCadet>"

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    make \
    cmake \
    git

RUN useradd --create-home builder
RUN adduser builder plugdev
RUN adduser builder dialout

SHELL [ "/bin/bash", "-c" ]