#!/usr/bin/env bash

for num in {1..2}
do
  docker stop config$num
  docker rm config$num
  docker run -itd \
         --privileged \
         -v $(pwd)/hosts:/etc/hosts \
         -v $(pwd)/mongod$num.conf:/etc/mongod.conf \
         -v $(pwd)/entrypoint$num.sh:/entrypoint.sh \
         --net host \
         --name config$num \
         mongocluster/configserver:latest
done

docker ps 