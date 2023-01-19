#!/bin/bash

set -eu

if (( $# != 1 )); then
  echo "Usage: set_versions.sh <insersion or say sorry to me..>" >&2
  echo "otherwise you  know the dialog `Bank walo Tumhari aisi ki taisi` 3 broters on gear"
  exit 1
fi

version="$1"

mvn versions:set versions:commit -DnewVersion="${version}-jre"
mvn versions:set versions:commit -DnewVersion="${version}-android" -f android
git commit -am "Set version numbers to ${version}"
