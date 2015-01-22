#!/bin/bash

set -u
set -e

# Check if GLUSTERFS Server Address [rovided by user
if [ -z $GFS_ADDRESS ]; then
    echo  "GlusterFS Server sddress not provided. Please provide the addres in GFS_ADDRESS environmental variable."
    exit 1;
else
    echo "$GFS_ADDRESS:$GFS_VOLUME $MOUNT_POINT glusterfs defaults,_netdev 0 0" >> /etc/fstab
fi
