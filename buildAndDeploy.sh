#!/bin/bash
set -e

if $CI; then
    echo "Running on travis ci..."
fi

IMAGE="$1"
VERSION="latest"
NAMESPACE="iras"

if [ $IMAGE == "master" ]; then
    echo "nothing to do for master..."
    exit 0;
fi

if [[ $IMAGE =~ -[0-9.]*$ ]]; then
    VERSION=$(echo "$IMAGE" | sed 's/^.*-\([0-9.]*\)$/\1/')
    IMAGE=$(echo "$IMAGE" | sed 's/^\(.*\)-[0-9.]*$/\1/')
fi

if [[ $VERSION =~ ^[0-9]*\.[0-9]*\.[0-9]$ ]]; then
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

if [[ $VERSION =~ ^[0-9]*\.[0-9]*$ ]]; then
    MAJORVERSION=$(echo "$VERSION" | cut -d "." -f 1)
    set +x
    docker tag $NAMESPACE/$IMAGE:$VERSION $NAMESPACE/$IMAGE:$MAJORVERSION
    docker tag $NAMESPACE/$IMAGE:$VERSION $NAMESPACE/$IMAGE:latest
    docker push $NAMESPACE/$IMAGE:$MAJORVERSION
    docker push $NAMESPACE/$IMAGE:latest
    set -x
fi
