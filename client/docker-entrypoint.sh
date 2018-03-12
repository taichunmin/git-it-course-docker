#!/bin/bash

sleep 5
/usr/sbin/sshd

trap 'exit 0' SIGTERM

while true; do
  /usr/bin/dashboard-reporter.sh
  sleep 60
done
