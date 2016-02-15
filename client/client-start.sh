#!/bin/sh
# client-start.sh

rsyslogd
cron
/usr/sbin/sshd
tail -F /var/log/syslog /var/log/cron.log
