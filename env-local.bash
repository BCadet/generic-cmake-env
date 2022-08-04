#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

if [ ! -d "$SCRIPTPATH/build" ]
then
    echo "# create folder build"
    mkdir $SCRIPTPATH/build
fi

echo "# move to build folder"
cd $SCRIPTPATH/build

echo "# run cmake and make"
cmake ../project && make
