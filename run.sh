#!/bin/bash

readonly APHRODITE_CONFIG_FILE=${APHRODITE_CONFIG_FILE:-$(pwd)/aphrodite-config.json}

if [ ! -e "${APHRODITE_CONFIG_FILE}" ]; then
  echo "Aphrodite config file does not exist: ${APHRODITE_CONFIG_FILE}"
  exit 1
fi

mvn -U "-Daphrodite.config=${APHRODITE_CONFIG_FILE}" exec:java
