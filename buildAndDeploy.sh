#!/bin/bash
set -e

IMAGE="$1"
VERSION={$2-'ubuntu-dev'}
NAMESPACE="iras"

if [ -z $IMAGE ]; then
    echo "please provide an image name to build"
    exit 1;
fi

if [[ $IMAGE =~ -ubuntu-[0-9.]*$ ]]; then
    VERSION=$(echo "$IMAGE" | sed 's/^.*-\(ubuntu-[0-9.]*\)$/\1/')
    IMAGE=$(echo "$IMAGE" | sed 's/^\(.*\)-ubuntu-[0-9.]*$/\1/')
fi

if [[ $VERSION =~ [0-9]*\.[0-9]*\.[0-9]$ ]]; then
    # version major.minor.fix gets major.minor on docker
    VERSION=$(echo "$VERSION" | cut -d "." -f 1,2)
fi

if [ ! -d $IMAGE ]; then
    echo "$IMAGE does not exist" >&2
    exit 1;
fi

echo "Image: $IMAGE"
echo "Version: $VERSION"
echo "Namespace: $NAMESPACE"

set -x

docker build -t $NAMESPACE/$IMAGE:$VERSION $IMAGE
docker push $NAMESPACE/$IMAGE:$VERSION

set +x

if [[ $VERSION =~ ^ubuntu-[0-9]*\.[0-9]*$ ]]; then
    MAJORVERSION=$(echo "$VERSION" | cut -d "." -f 1)
    set +x
    docker tag $NAMESPACE/$IMAGE:$VERSION $NAMESPACE/$IMAGE:$MAJORVERSION
    docker tag $NAMESPACE/$IMAGE:$VERSION $NAMESPACE/$IMAGE:ubuntu-latest
    docker push $NAMESPACE/$IMAGE:$MAJORVERSION
    docker push $NAMESPACE/$IMAGE:latest
    set -x
fi
