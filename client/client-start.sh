#!/bin/sh
# client-start.sh

rsyslogd
cron
touch /var/log/cron.log
/usr/sbin/sshd
tail -F /var/log/syslog /var/log/cron.log
