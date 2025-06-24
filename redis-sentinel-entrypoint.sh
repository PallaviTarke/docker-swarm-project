#!/bin/sh
until redis-cli -h redis-master -p 6379 ping | grep -q PONG; do
  echo "Waiting for redis-master..."
  sleep 2
done

exec redis-server /etc/redis/sentinel.conf --sentinel
