#!/bin/bash

set -e

if [ ! -d "./src" ]; then
    echo "Error: Can't find \"./src\". Exit."
    exit 1
fi

if [ -d "./target" ]; then
    rm -rf ./target
fi

cp -r ./src ./target

cd ./target

if ! lb config; then
    echo "Error: Can't execute \"lb config\". Exit."
    cd ./../
    exit 1
fi

if [ ! -d "includes.chroot" ]; then
    echo "Warning: Can't find \"includes.chroot\""
else
    mv includes.chroot config
fi

if [ ! -d "package-lists" ]; then
    echo "Warning: Can't find \"package-lists\""
else
    rm -rf ./config/package-lists
    mv package-lists config
fi

cd ./../