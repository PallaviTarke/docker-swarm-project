#!/bin/bash
until redis-cli -h 10.0.1.67 -p 6379 ping | grep -q PONG; do
  echo "Waiting for redis-master (10.0.1.67:6379) to be ready..."
  sleep 2
done
exec redis-sentinel /etc/redis/sentinel.conf
