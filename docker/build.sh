#!/bin/bash

set -e
set -x


if [ -z "${1}" ] || [ -z "${2}" ]
then
    echo "no arguments are given! Using the default settings ..."
    echo "docker_build.sh [PROJECT_PATH] [DOCKERFILE within PROJECT_PATH]"
    PROJECT_PATH=${PWD}
    DOCKERFILE=${PROJECT_PATH}/rootproject.dockerfile
else
    PROJECT_PATH=${1}
    DOCKERFILE=${1}/${2}
fi

DOCKER_IMAGE=rootproject_build:22.04

docker image build --build-arg USER_NAME=${USER} --build-arg GROUP_NAME=${USER} --build-arg USER_ID=$(id -u ${USER}) --build-arg GROUP_ID=$(id -g ${USER}) ${PROJECT_PATH} -f ${DOCKERFILE} -t ${DOCKER_IMAGE}


