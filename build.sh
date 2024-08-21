#!/bin/bash

tag="v0.12.11"

function build_push() {
    mdbx_tool=$1

    docker build -t eldarkurbanov/$mdbx_tool:$tag -t eldarkurbanov/$mdbx_tool --target $mdbx_tool --platform=linux/amd64,linux/arm/v5,linux/arm/v7,linux/arm64/v8,linux/ppc64le,linux/s390x .
    docker push eldarkurbanov/$mdbx_tool:$tag
    docker push eldarkurbanov/$mdbx_tool
}

build_push "mdbx_dump"
build_push "mdbx_load"