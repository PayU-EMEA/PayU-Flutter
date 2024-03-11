#!/bin/sh

PWD=$(pwd)

cd "$1" || exit

#flutter clean
flutter pub get

cd "$PWD"
