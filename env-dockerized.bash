#!/bin/bash
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

ACTION=$1
ACTION=${ACTION:="generate"}
shift

FOLDER=${PWD##*/}
FOLDER=${FOLDER:-/}        # to correct for the case where PWD=/

IMAGE=${FOLDER,,}

if [ ! -d $SCRIPTPATH/build ]; then
    mkdir $SCRIPTPATH/build
fi;

case $ACTION in
    "generate")
        docker buildx build -t $IMAGE .
        ;;
    "make")
        docker run -it --rm \
            -v `pwd`:/workspaces/$FOLDER \
            --workdir=/workspaces/$FOLDER/build \
            --env REMOTE_USER="builder" \
            --env NEW_UID=$(id -u) \
            --env NEW_GID=$(id -g) \
            $IMAGE "cmake ../project && make $@"
        ;;
    "bash")
        docker run -it --rm \
            -v `pwd`:/workspaces/$FOLDER \
            --workdir=/workspaces/$FOLDER \
            --env REMOTE_USER="builder" \
            --env NEW_UID=$(id -u) \
            --env NEW_GID=$(id -g) \
            $IMAGE
        ;;
    *)
        echo "Action $ACTION not available"
        ;;
esac
