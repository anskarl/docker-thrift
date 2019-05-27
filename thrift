#!/usr/bin/env bash

: ${THRIFT_VERSION:="0.10.0"}

docker run --rm  -v $PWD:$PWD --workdir $PWD anskarl/thrift:$THRIFT_VERSION $@