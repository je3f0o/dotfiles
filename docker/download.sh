#!/bin/bash

BASE_URL=https://raw.githubusercontent.com/je3f0o/dotfiles/master/docker

function download {
  curl -s -o $1 $BASE_URL/$1
}

download Dockerfile
download docker-compose.yml
download entrypoint.sh
download id_rsa.pub