# Lilt Drupal Environment
A portable Drupal environment for development/demoing the TMGMT Lilt module.

## Dependencies
Follow the links for installation of the dependencies.

- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- [DDEV-Local](https://www.ddev.com/get-started/)

## Quick Start

1. Install Docker Desktop & DDEV-Local per the instructions in the above links.
2. Execute `./start.sh` (or if you have a Lilt API key run `./start.sh MY_LILT_API_KEY` to configure the module)
3. After environment setup, a browser window should open. The default Drupal login credentials are `admin` / `admin`.

## Development
By default, this environment is setup for demo purposes. If you'd like to use
it for development, you can enable a developer configuration via this command:

- `ddev exec drush cim --source '../config/dev' -y`

This enables modules & configuration to help with Drupal module development.

This environment also has a few Composer scripts used for testing the TMGMT
Lilt module. The whole suite can be ran with this command:

- `./tests.sh`

See the module [`tests`](https://github.com/tgallant/tmgmt_lilt/tree/8.x-1.x/tests) dir for more information.

### Add Module Remote Repo
By default, this environment uses https://github.com/lilt/tmgmt_lilt to source
the TMGMT Lilt module. For development contributions, you can add your own
forked project for submitting PRs:

- Fork https://github.com/lilt/tmgmt_lilt on GitHub
- `cd web/modules/contrib/tmgmt_lilt`
- `git remote add my_repo git@github.com:my_username/tmgmt_lilt.git`
- `git checkout -b my_feature`
- `git push my_repo my_feature`
- Complete PR on GitHub
