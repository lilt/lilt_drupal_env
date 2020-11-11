#!/bin/bash

# Set stop on error / enable debug
set -euo pipefail
#set -vx

# Check Reqs
if (! command -v ddev > /dev/null 2>&1 ); then
  echo "ddev CLI is needed."
  echo "Go to https://www.ddev.com/get-started/ for install instructions."
  exit 1
else
  # deprecation check is informational only
  ddev composer run-script deprecation-check || true
  ddev composer run-script lint
  ddev composer run-script code-standards
  ddev composer run-script unit-test
  ddev composer run-script functional-js
fi
