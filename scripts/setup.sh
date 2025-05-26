#!/bin/sh

PWD=$(pwd)

cd "$1" || exit

flutter pub get

cd "$PWD" || exit
