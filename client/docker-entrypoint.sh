#!/bin/sh
# client-start.sh

sleep 15
/usr/sbin/sshd

while true; do
  /usr/bin/dashboard-reporter.sh
  sleep 60
done
