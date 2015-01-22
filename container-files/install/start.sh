#!/bin/bash

set -u
set -e

mkdir -p $GLS_MOUNT
ip=$(dig +short myip.opendns.com @resolver1.opendns.com)
volume_status="$(gluster volume list 2>&1)"
if [ "$GLS_ADDRESS" != "127.0.0.1" ] || [ "$volume_status" == "No volumes present in cluster" ]; then
    gluster peer probe "$GLS_ADDRESS"
    pool="$(gluster pool list | wc -l)"
    let "pool-=1"
    if [ "$pool" == "2" ]; then
    server1="$(gluster pool list | awk 'NR==2 {print$2}')"
    server2="$(gluster --remote-host=$server1 pool list | awk 'NR==2 {print$2}')"
    gluster volume create $GLS_VOLUME_NAME replica 2 transport tcp $server1:$GLS_MOUNT/brick $server2:$GLS_MOUNT/brick force 
    gluster volume start $GLS_VOLUME_NAME
    fi
fi
