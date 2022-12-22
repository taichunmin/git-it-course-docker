#!/bin/bash
# git clone https://github.com/taichunmin/git-it-course-docker.git
set -euo pipefail
cd "$(dirname "$0")"

export LANG=C.UTF-8
export LC_ALL=C.UTF-8
export LANGUAGE=C.UTF-8

sudo apt update && sudo apt upgrade -y
curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh
sudo bash /tmp/nodesource_setup.sh
rm /tmp/nodesource_setup.sh
sudo apt install nodejs
npm install -g yarn

if [ ! "$(docker -v)" ]; then
  curl -sSL get.docker.com | sh
  sudo usermod -aG docker $USER
fi

if [ ! "$(docker-compose -v)" ]; then
  sudo curl -L "https://github.com/docker/compose/releases/download/$(curl -sL https://api.github.com/repos/docker/compose/releases/latest | grep tag_name | cut -d'"' -f 4)/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
fi

git submodule update --init
if [ ! -f webapp/.env ]; then
  cp webapp/.env.example webapp/.env
fi

sudo docker-compose pull
sudo docker-compose run --rm dashboard yarn install --production
sudo yarn scale 1
