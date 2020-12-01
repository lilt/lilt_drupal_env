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

### Creating Releases
If you are a project maintainer, this repo can be used to prepare releases on
drupal.org.

- Auth your SSH key associated with your d.o. account: `ddev auth ssh`
- `cd web/modules/contrib/tmgmt_lilt`
- Add git tag with 8.x-VERSION format (e.g. `git tag '8.x-1.0'`). See drupal.org [release conventions](https://www.drupal.org/node/1015226).
- Sync to drupal.org Gitlab (e.g. `composer run-script sync-do`).
- Edit [project page](https://www.drupal.org/project/tmgmt_lilt).
- Use **Releases** tab to **Add new release**.
- Select tag and click **Next**.
- Leave **Version string** as is.
- Add detailed release info (e.g. bug fixes, features, etc.) under **Release notes**.
- Add short sentence that describes the release under **Short description**. This sentenced will be used on the **Downloads** section on the [project page](https://www.drupal.org/project/tmgmt_lilt).
- Use **Release type** for noting type of release (e.g. bug fix, feature).  See drupal.org [project release types](https://www.drupal.org/node/1025122#type).
- Click **Save**.
- Use **Releases** tab to set the a new release to **Recommended** (if applicable).
