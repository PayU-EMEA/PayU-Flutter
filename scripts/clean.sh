#!/bin/sh

PWD=$(pwd)

cd "$1" || exit

flutter clean

cd "$PWD" || exit
