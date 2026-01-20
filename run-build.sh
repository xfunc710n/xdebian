#!/bin/bash

set -e

if [ ! -d "./target" ]; then
    echo "Error: Can't find \"./target\". Exit."
    exit 1
fi

cd ./target

sudo lb build

cd ./../