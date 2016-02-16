#!/bin/bash

PORTS=`docker ps --filter "label=role=git-it-client" --format '"{{.ID}}":{{.Ports}}' | tr '\n' ',' | sed -r 's/(0\.){3}0:|->22\/tcp//g' | sed -r 's/^(.*),$/{\1}/'`
SCOREBOARD=`docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' scoreboard`

# echo "PORTS = $PORTS"

curl \
--data-urlencode "ports=${PORTS}" \
"http://$SCOREBOARD/ports/update"
