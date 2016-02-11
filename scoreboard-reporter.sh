#!/bin/bash

HOST_IP=`/sbin/ip route|awk '/default/ { print $3 }'`
COMPLETED=`cat /root/.config/git-it/completed.json || echo []`
MID=`hostname`
NAME=`git config --global user.name || hostname`

curl \
--data-urlencode "completed=${COMPLETED}" \
--data-urlencode "mid=${MID}" \
--data-urlencode "name=${NAME}" \
$HOST_IP/debug.php
