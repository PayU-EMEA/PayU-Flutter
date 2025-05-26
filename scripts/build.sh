#!/bin/sh

PWD=$(pwd)

cd "$1" || exit

flutter pub run build_runner build --delete-conflicting-outputs

cd "$PWD" || exit


