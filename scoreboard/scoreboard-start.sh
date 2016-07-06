#!/bin/sh
# scoreboard-start.sh

cd /var/www/git-it-course-scoreboard
git fetch --all && git reset --hard origin/master
php artisan key:generate
composer dump-autoload
php artisan optimize
service apache2 start
redis-server /etc/redis/redis.conf &
chmod a+rw /var/run/docker.sock
/usr/sbin/sshd
rsyslogd
cron
env | grep _ >> /etc/environment
tail -F /var/log/apache2/access.log /var/log/syslog /var/log/cron.log
