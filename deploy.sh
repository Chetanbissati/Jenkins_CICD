#!/bin/bash

docker stop webapp || true
docker rm webapp || true

docker run -d -p 80:80 --name webapp <dockerhub-username>/webapp:latest
