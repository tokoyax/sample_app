#!/bin/sh
WORKDIR=`pwd`
docker run -dti \
  --hostname myapp \
  --name myapp \
  --publish 3000:3000 \
  --volume ${WORKDIR}:/myapp \
  tokoyax/rails:0.0.0

