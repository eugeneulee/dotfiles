#!/bin/bash

# Default to '*' key pattern, meaning all redis keys in the namespace
HOST=$1
REDIS_KEY_PATTERN="${REDIS_KEY_PATTERN:-*}"
printf $REDIS_KEY_PATTERN
for key in $(redis-cli -h $HOST --scan --pattern "$REDIS_KEY_PATTERN")
do
    type=$(redis-cli -h $HOST type $key)
    if [ $type = "list" ]
    then
        printf "$key => \n$(redis-cli -h $HOST lrange $key 0 -1 | sed 's/^/  /')\n"
    elif [ $type = "hash" ]
    then
        printf "$key => \n$(redis-cli -h $HOST hgetall $key | sed 's/^/  /')\n"
    else
        printf "$key => $(redis-cli -h $HOST get $key)\n"
    fi
done

