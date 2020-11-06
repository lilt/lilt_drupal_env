#!/bin/bash

# Set stop on error / enable debug
set -euo pipefail
#set -vx

LILT_API_KEY=${1-aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa}

# Check Reqs
if (! command -v ddev > /dev/null 2>&1 ); then
  echo "ddev CLI is needed."
  echo "Go to https://www.ddev.com/get-started/ for install instructions."
  exit 1
else
  ddev start
  ddev composer install
  ddev exec drush site-install standard --site-name 'Lilt Drupal Environment' --account-name 'admin' --account-mail 'admin@example.com' --site-mail 'nobody@example.com' --account-pass 'admin' -y
  ddev exec drush cset 'system.site' uuid '90e98566-c305-4174-a737-8784dd146112' -y
  ddev exec drush cr
  ddev exec drush cim --source '../config/sync' -y
  ddev exec drush cset tmgmt.translator.lilt settings.lilt_api_key "$LILT_API_KEY" -y
  ddev launch '/user/login?destination=admin/tmgmt/sources'
fi
