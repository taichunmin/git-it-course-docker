#!/bin/sh
# scoreboard-start.sh

service apache2 start
service redis_6379 start
tail -F /var/log/apache2/access.log
