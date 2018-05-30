#!/usr/bin/env bash

docker stop router
docker rm router
docker run -itd \
         --privileged \
         -v $(pwd)/hosts:/etc/hosts \
         -v $(pwd)/mongod.conf:/etc/mongos.conf \
         -v $(pwd)/entrypoint.sh:/entrypoint.sh \
         --net host \
         --name router \
         mongocluster/router:latest


docker ps 