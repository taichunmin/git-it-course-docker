#!/bin/sh
# scoreboard-start.sh

cd /var/www/git-it-course-scoreboard
git pull
php artisan key:generate
service apache2 start
redis-server /etc/redis/redis.conf &
/usr/sbin/sshd
tail -F /var/log/apache2/access.log
