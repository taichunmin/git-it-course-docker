#!/bin/sh
# client-start.sh

rsyslogd
cron
/usr/sbin/sshd
/usr/bin/scoreboard-reporter.sh
tail -F /var/log/syslog /var/log/cron.log
