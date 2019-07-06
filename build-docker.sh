#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

DOCKER_IMAGE=${DOCKER_IMAGE:-yeahreumpay/yeahreumd-develop}
DOCKER_TAG=${DOCKER_TAG:-latest}

BUILD_DIR=${BUILD_DIR:-.}

rm docker/bin/*
mkdir docker/bin
cp $BUILD_DIR/src/yeahreumd docker/bin/
cp $BUILD_DIR/src/yeahreum-cli docker/bin/
cp $BUILD_DIR/src/yeahreum-tx docker/bin/
strip docker/bin/yeahreumd
strip docker/bin/yeahreum-cli
strip docker/bin/yeahreum-tx

docker build --pull -t $DOCKER_IMAGE:$DOCKER_TAG -f docker/Dockerfile docker
