#!/bin/bash

# git clone https://github.com/taichunmin/git-it-course-docker.git
cd "$(dirname "$0")"
apt-get update -qq && apt-get upgrade -qqy
rm /etc/mdadm/mdadm.conf
update-initramfs -u
curl -sSL get.docker.com | sh
curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose --version
apt-get install htop
apt-get autoremove -y

cp webapp/.env.example webapp/.env
git submodule update --init
docker-compose build
docker run --rm -v "$(realpath ./webapp):/root/webapp" node:latest bash -c 'cd /root/webapp && yarn install'
