#!/bin/bash
# docker-entrypoint.sh

cd /var/www/html
yarn install

forever -a --uid dashboard --colors --killSignal=SIGTERM --watch --watchDirectory=/var/www/html ./bin/www
