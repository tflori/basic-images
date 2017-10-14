#!/bin/bash
set -e

if $CI; then
    echo "Running on travis ci..."
fi

IMAGE="$TRAVIS_BRANCH$1"
NAMESPACE="iras"

if [ $IMAGE == "master" ]; then
    echo "nothing to do for master..."
    exit 0;
fi

if [[ $IMAGE =~ -[0-9.]*$ ]]; then
    VERSION=$(echo "$IMAGE" | sed 's/^.*-\([0-9.]*\)$/\1/')
    IMAGE=$(echo "$IMAGE" | sed 's/^\(.*\)-[0-9.]*$/\1/')
else
    VERSION=latest
fi

if [ -z $TRAVIS_TAG ]; then
    # non tags are always latest versions
    VERSION=latest
elif [[ $IMAGE =~ -[0-9]*\.[0-9]*\.[0-9]$ ]]; then
    # version major.minor.fix gets major.minor on docker
    VERSION=$(echo "$VERSION" | cut -d "." -f 1,2)
fi

echo "Image: $IMAGE"
echo "Version: $VERSION"
echo "Namespace: $NAMESPACE"
echo "Username: $DOCKER_USERNAME"

if [ ! -d $IMAGE ]; then
    echo "$IMAGE does not exist" >&2
    exit 1;
fi

set -x

docker build -t $NAMESPACE/$IMAGE:$VERSION $IMAGE
docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
docker push $NAMESPACE/$IMAGE:$VERSION
