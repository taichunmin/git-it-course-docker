#!/bin/bash

PORTS=`docker ps --filter "label=role=git-it-client" --format '"{{.ID}}":{{.Ports}}' | tr '\n' ',' | sed -r 's/(0\.){3}0:|->22\/tcp//g' | sed -r 's/^(.*),$/{\1}/'`
DASHBOARD=`docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' dashboard`

# echo "PORTS = $PORTS"

curl -s \
--data-urlencode "ports=${PORTS}" \
"http://$DASHBOARD/ports/update"
