#!/usr/bin/env bash

: ${THRIFT_VERSION:="latest"}

docker run --rm --user $UID  -v $PWD:$PWD --workdir $PWD anskarl/thrift:$THRIFT_VERSION $@
