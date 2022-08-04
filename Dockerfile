# syntax=edrevo/dockerfile-plus:0.1.0

FROM ubuntu:20.04 as generic-cmake-env

LABEL maintainer="BCadet <https://github.com/BCadet>"

RUN apt-get update && \
    DEBIAN_FRONTEND=noninterractive apt-get install -y \
    make \
    cmake \
    gosu

# setup entrypoint
ADD https://gist.githubusercontent.com/BCadet/372702916a20b141cb78ea889e3dae59/raw/73822ba555bfbd75ab7c09c90d463585535e5a0e/container-entrypoint /container-entrypoint
RUN chmod +x /container-entrypoint
ENTRYPOINT [ "/container-entrypoint" ]

SHELL [ "/bin/bash", "-c" ]

# create user
RUN useradd --create-home builder

INCLUDE+ project/Dockerfile