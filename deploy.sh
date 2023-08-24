#!/bin/bash

cmd=$1

DOCKER_USER="thangphan"

info() {
    docker info
}

shift

case "$cmd" in
    info)
        info
        ;;
    *)
        echo "Unknown command: $cmd"
        exit 1
        ;;
esac
