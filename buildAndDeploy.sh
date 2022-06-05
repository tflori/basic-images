#!/bin/bash
set -e

IMAGE="$1"
VERSION={$2-'dev'}
OS=""
NAMESPACE="iras"

if [ -z "$IMAGE" ]; then
    echo "please provide an image name to build"
    exit 1;
fi

if [[ $IMAGE =~ -[0-9.]*$ ]]; then
    VERSION=$(echo "$IMAGE" | sed 's/^.*-\([0-9.]*\)$/\1/')
    IMAGE=$(echo "$IMAGE" | sed 's/^\(.*\)-[0-9.]*$/\1/')
fi

if [[ $IMAGE =~ -(alpine|ubuntu|centos|debian)$ ]]; then
  OS=$(echo "$IMAGE" | sed 's/^\(.*\)-\(alpine\|ubuntu\|centos\|debian\)$/\2/')-
  IMAGE=$(echo "$IMAGE" | sed 's/^\(.*\)-\(alpine\|ubuntu\|centos\|debian\)$/\1/')
fi

if [[ $VERSION =~ [0-9]*\.[0-9]*\.[0-9]$ ]]; then
    MAJOR_VERSION=$(echo "$VERSION" | cut -d "." -f 1)
    MINOR_VERSION=$(echo "$VERSION" | cut -d "." -f 2)
fi

if [ ! -d $IMAGE ]; then
    echo "$IMAGE does not exist" >&2
    exit 1;
fi

echo "Image: $IMAGE"
echo "Version: $VERSION"
echo "OS: $OS"
echo "Namespace: $NAMESPACE"

set -x
docker build -t $NAMESPACE/$IMAGE:$OS$VERSION $IMAGE
docker push $NAMESPACE/$IMAGE:$OS$VERSION
{ set +x; } 2>/dev/null

if [[ -n "$MAJOR_VERSION" ]]; then
    for tag in \
      $NAMESPACE/$IMAGE:$OS$MAJOR_VERSION.$MINOR_VERSION \
      $NAMESPACE/$IMAGE:$OS$MAJOR_VERSION \
      $NAMESPACE/$IMAGE:$OS"latest" \
    ; do
      set -x
      docker tag $NAMESPACE/$IMAGE:$OS$VERSION $tag
      docker push $tag
      { set +x; } 2>/dev/null
    done
fi
