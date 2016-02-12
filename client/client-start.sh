#!/bin/sh
# client-start.sh

rsyslogd
cron
touch /var/log/cron.log
service sshd start
tail -F /var/log/syslog /var/log/cron.log
