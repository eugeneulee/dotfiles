#!/bin/bash

if [ -z "$2" ]
  then
    printf "\nUsage: ./get_redis_keys_and_values.sh <host> <searchPattern>"
  else
    HOST=$1
    REDIS_SEARCH_PATTERN=$2
    printf "\nhost: $HOST"
    printf "\nsearch pattern:$REDIS_SEARCH_PATTERN"
    printf `echo "keys $REDIS_SEARCH_PATTERN*" | redis-cli -h $HOST |sed 's/^/get /'`
    echo "keys $REDIS_SEARCH_PATTERN*" | redis-cli -h $HOST | sed 's/^/get /' | redis-cli -h $HOST
fi

