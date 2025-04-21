#!/bin/sh

set -e
set -x

PROJECT_ROOT=$(dirname ${PWD})

DOCKER_IMAGE=rootproject_build:22.04

# docker run -it rootproject/root:latest

docker run -it --rm --name rootproject_container --cap-add=NET_ADMIN --device /dev/net/tun \
    --workdir=${PROJECT_ROOT} \
    -p 8888:8888 \
    -v /home/${USER}/.local:/home/${USER}/.local \
    -v ${PROJECT_ROOT}:${PROJECT_ROOT} \
    -v /home/${USER}/.ssh/id_rsa:/home/${USER}/.ssh/id_rsa \
    -v /home/${USER}/.ssh/id_rsa.pub:/home/${USER}/.ssh/id_rsa.pub \
    -v /home/${USER}/.ssh/known_hosts:/home/${USER}/.ssh/known_hosts \
    --user ${USER}:${USER} ${DOCKER_IMAGE} /bin/bash
