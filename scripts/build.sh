#!/bin/sh
set -e

PWD=$(pwd)

cd "$1" || exit

flutter pub run build_runner build

cd "$PWD" || exit
