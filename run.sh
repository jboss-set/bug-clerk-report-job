#!/bin/bash

readonly TRACKER_PASSWORD=${TRACKER_PASSWORD}
readonly TRACKER_USERNAME=${TRACKER_USERNAME}

if [ -z "${TRACKER_PASSWORD}" ]; then
  echo "Missing Bugzilla Password for user."
  exit 1
fi


mvn "-Daphrodite.config=./aphrodite-config.json" exec:java
