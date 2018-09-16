#!/usr/bin/env bash

set -e

# Find the installers and run them iteratively
for install in $(
  find topics -name install.pre.sh;
  find topics -name install.sh;
  find topics -name install.post.sh;
); do
  echo "> $install"
  $install
done
