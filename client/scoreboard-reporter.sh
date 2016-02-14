#!/bin/bash

COMPLETED=`test -r /root/.config/git-it/completed.json && cat /root/.config/git-it/completed.json || echo []`
MID=`hostname`
NAME=`git config --global user.name || hostname`
GITHUB=`git config --global user.username || echo ''`

curl \
--data-urlencode "completed=${COMPLETED}" \
--data-urlencode "mid=${MID}" \
--data-urlencode "name=${NAME}" \
--data-urlencode "github=${GITHUB}" \
http://scoreboard/completed/update
