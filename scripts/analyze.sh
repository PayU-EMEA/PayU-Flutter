#!/bin/sh

PWD=$(pwd)

cd "$1" || exit

flutter analyze

cd "$PWD" || exit


