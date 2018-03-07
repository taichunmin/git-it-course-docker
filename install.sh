#!/bin/bash
# git clone https://github.com/taichunmin/git-it-course-docker.git
set -euo pipefail
cd "$(dirname "$0")"

export LANG=C.UTF-8
export LC_ALL=C.UTF-8
export LANGUAGE=C.UTF-8

sudo apt-get update -qq && sudo apt-get upgrade -qqy

if [ ! "$(docker -v)" ]; then
  curl -sSL get.docker.com | sh
  sudo usermod -aG docker $USER
fi

if [ ! "$(docker-compose -v)" ]; then
  sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
fi

git submodule update --init
if [ ! -f webapp/.env ]; then
  cp webapp/.env.example webapp/.env
fi

sudo docker-compose pull
docker run --rm -v "$(realpath ./webapp):/root/webapp" node:latest bash -c 'cd /root/webapp && yarn install'
