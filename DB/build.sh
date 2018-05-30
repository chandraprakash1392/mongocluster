#!/usr/bin/env bash

docker build -t mongocluster/dbserver .

bash ./run.sh