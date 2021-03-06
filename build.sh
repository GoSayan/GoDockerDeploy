#!/usr/bin/env bash

IMAGE="application-builder"

docker build --rm -f Dockerfile.compile . --tag $IMAGE

# remove binary if exists
FILE="application"
if [ -e "$FILE" ];
then
  rm -f "$FILE"
fi

docker run --rm -it -v "$GOPATH":/gopath -e "FILE=$FILE" -v "$(pwd)":/$FILE \
  -w "/$FILE" $IMAGE sh -c 'go build -a --installsuffix cgo --ldflags="-s" -o $FILE'
