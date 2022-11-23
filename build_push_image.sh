#!/bin/sh

#build docker image from Dockerfile from current directory with name item-app and tag v1
docker build -t item-app:v1 .
echo '\n\n' #print new line to give some space

# show list of docker images
docker images
echo '\n\n' #print new line to give some space

# create a new image tag from source image, still refer to the same image, but have different name/tag
docker tag item-app:v1 ghcr.io/lionelritchie29/item-app:v1
echo '\n\n' #print new line to give some space

# export github token to env variable
export GITHUB_PACKAGES_TOKEN=

# login to github packages
echo $GITHUB_PACKAGES_TOKEN | docker login ghcr.io -u lionelritchie29 --password-stdin
echo '\n\n' #print new line to give some space

# push the built image to github packages
docker push ghcr.io/lionelritchie29/item-app:v1
echo '\n\n' #print new line to give some space