#!/bin/bash

COMPLETED=`test -r /root/.config/git-it/completed.json && cat /root/.config/git-it/completed.json || echo []`
MID=`hostname`
NAME=`git config --global user.name || hostname`
GITHUB=`git config --global user.username || echo ''`
OWNED=`[ "never" = "$(chage -l root | grep 'Password expires' | sed -r 's/^[^:]+: //')" ] && echo '1' || echo '0'`

curl \
--data-urlencode "completed=${COMPLETED}" \
--data-urlencode "mid=${MID}" \
--data-urlencode "name=${NAME}" \
--data-urlencode "github=${GITHUB}" \
--data-urlencode "owned=${OWNED}" \
http://scoreboard/completed/update
