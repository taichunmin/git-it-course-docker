#!/bin/sh
# docker-entrypoint.sh

sleep 5
/usr/sbin/sshd

while true; do
  /usr/bin/dashboard-reporter.sh
  sleep 60
done
