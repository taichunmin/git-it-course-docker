#!/bin/bash
# git clone https://github.com/taichunmin/git-it-course-docker.git
set -euo pipefail
cd "$(dirname "$0")"

export LANG=C.UTF-8
export LC_ALL=C.UTF-8
export LANGUAGE=C.UTF-8

apt-get update -qq && apt-get upgrade -qqy

if [ ! "$(docker -v)" ]; then
  curl -sSL get.docker.com | sh
fi

if [ ! "$(docker-compose -v)" ]; then
  DOCKER_COMPOSE_RELEASE=$(curl -sL https://api.github.com/repos/docker/compose/releases/latest)
  DOCKER_COMPOSE_VERSION=$(echo $DOCKER_COMPOSE_RELEASE | sed -Ee 's/.*"tag_name":\s*"([^"]*)".*/\1/')
  curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" > /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
fi

apt-get install htop
apt-get autoremove -y

git submodule update --init
if [ ! -f webapp/.env ]; then
  cp webapp/.env.example webapp/.env
fi

docker-compose pull
docker run --rm -v "$(realpath ./webapp):/root/webapp" node:latest bash -c 'cd /root/webapp && yarn install'
