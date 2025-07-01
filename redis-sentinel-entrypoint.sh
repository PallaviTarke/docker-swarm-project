#!/bin/sh
# Wait until redis-master is reachable
until redis-cli -h redis-master -p 6379 ping | grep -q PONG; do
  echo "Waiting for redis-master to be ready..."
  sleep 2
done

# Start Redis Sentinel
exec redis-server /etc/redis/sentinel.conf --sentinel

