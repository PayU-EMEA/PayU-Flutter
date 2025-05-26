#!/bin/sh

PWD=$(pwd)

cd "$1" || exit

flutter pub get
flutter pub upgrade
flutter pub run dependency_validator

cd "$PWD" || exit
