#!/bin/sh
set -e

NEW_VERSION="$1"
SDK_VERSION_FILE="payu_core/lib/src/constants/sdk_version.dart"

if ! echo "$NEW_VERSION" | grep -Eq '^[0-9]+\.[0-9]+\.[0-9]+(-[0-9A-Za-z.]+)?$'; then
  echo "Usage: make bump_version VERSION=x.y.z"
  exit 1
fi

OLD_VERSION=$(yq '.version' payu_core/pubspec.yaml)

if [ "$OLD_VERSION" = "$NEW_VERSION" ]; then
  echo "Version is already $NEW_VERSION"
  exit 1
fi

echo "Bumping version $OLD_VERSION -> $NEW_VERSION"

FILES=$(find . \( -name build -o -name .dart_tool -o -name .git \) -prune -o \( -name pubspec.yaml -o -name pubspec.git.yaml \) -print)

export OLD_VERSION NEW_VERSION
for file in $FILES; do
  perl -pi -e 's/^version: \Q$ENV{OLD_VERSION}\E$/version: $ENV{NEW_VERSION}/; s/^(\s+)ref: \Q$ENV{OLD_VERSION}\E$/$1ref: $ENV{NEW_VERSION}/' "$file"
done
perl -pi -e "s/'\Q\$ENV{OLD_VERSION}\E'/'\$ENV{NEW_VERSION}'/" "$SDK_VERSION_FILE"

# shellcheck disable=SC2086
if grep -n -F "$OLD_VERSION" $FILES "$SDK_VERSION_FILE"; then
  echo "Old version $OLD_VERSION still found in files above"
  exit 1
fi

echo "Done. Remember to update CHANGELOG.MD and README.md"
