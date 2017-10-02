#!/bin/bash
# dashboard-start.sh

cd /var/www/html
yarn install

forever -a --uid dashboard --colors --killSignal=SIGTERM --watch --watchDirectory=/var/www/html ./bin/www
