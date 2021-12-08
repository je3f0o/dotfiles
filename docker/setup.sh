#!/bin/bash

cd /tmp

BASE_URL=https://raw.githubusercontent.com/je3f0o/dotfiles/master/docker

function download {
  curl $BASE_URL/$1 -o $1
}

download Dockerfile
download docker-compose.yml
download entrypoint.sh
download id_rsa.pub