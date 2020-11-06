<?php

/**
 * @file
 * Specify default config sync dir.
 */

if (defined('CONFIG_SYNC_DIRECTORY') && empty($config_directories[CONFIG_SYNC_DIRECTORY])) {
  $config_directories[CONFIG_SYNC_DIRECTORY] = '../config/sync';
}
elseif (empty($settings['config_sync_directory'])) {
  $settings['config_sync_directory'] = '../config/sync';
}

// #ddev-generated: Automatically generated Drupal settings file.
if (file_exists($app_root . '/' . $site_path . '/settings.ddev.php') && getenv('IS_DDEV_PROJECT') == 'true') {
  include $app_root . '/' . $site_path . '/settings.ddev.php';
}
