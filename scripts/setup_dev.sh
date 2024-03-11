#!/bin/sh

PWD=$(pwd)

cd "$1" || exit

flutter clean
flutter pub get
flutter pub upgrade
flutter pub run dependency_validator

cd "$PWD"
