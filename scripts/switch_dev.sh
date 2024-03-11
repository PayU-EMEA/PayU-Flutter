#!/bin/sh

PWD=$(pwd)
PAYU_SOURCE="$2"

if [ "$PAYU_SOURCE" != "local" ] && [ "$PAYU_SOURCE" != "git" ]; then
  echo "'local' or 'git'"
  exit
fi

cd "$1" || exit

if [ "$PAYU_SOURCE" = "local" ]; then
  export DEPENDENCIES=$(yq  '.dependencies + load("pubspec.local.yaml")' pubspec.yaml)
elif [ "$PAYU_SOURCE" = "git" ]; then
  export DEPENDENCIES=$(yq  '.dependencies + load("pubspec.git.yaml")' pubspec.yaml)
fi

yq -i e '.dependencies=env(DEPENDENCIES)' pubspec.yaml
unset DEPENDENCIES

cd "$PWD"


