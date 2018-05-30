#!/usr/bin/env bash

for num in {1..2}
do
  if [[ $num -eq 1 ]]
  then
    port=27020
  else
    port=27021
  fi
  docker stop db$num
  docker rm db$num
  docker run -itd \
         --privileged \
         -v $(pwd)/hosts:/etc/hosts \
         -v $(pwd)/mongod$num.conf:/etc/mongod.conf \
         -v $(pwd)/entrypoint$num.sh:/entrypoint.sh \
         --net bridge \
         -p $port:$port \
         --name db$num \
         mongocluster/dbserver:latest
done

docker ps 