#!/bin/bash

if $CI; then
    echo "Running on travis ci..."
fi

IMAGE="$TRAVIS_BRANCH$1"

if [[ $IMAGE =~ -[0-9.]*$ ]]; then
    VERSION=$(echo "$IMAGE" | sed 's/^.*-\([0-9.]*\)$/\1/')
    IMAGE=$(echo "$IMAGE" | sed 's/^\(.*\)-[0-9.]*$/\1/')
else
    VERSION=latest
fi

if [ -z $TRAVIS_TAG ]; then
    VERSION=latest
fi

echo "Image: $IMAGE"
echo "Version: $VERSION"
