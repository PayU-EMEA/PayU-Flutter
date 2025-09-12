#!/bin/sh

PWD=$(pwd)

cd "$1" || exit

flutter pub upgrade
flutter pub run dependency_validator

cd "$PWD" || exit
