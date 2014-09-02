<?php
/**
 * @file
 * ggp_features.features.user_role.inc
 */

/**
 * Implements hook_user_default_roles().
 */
function ggp_features_user_default_roles() {
  $roles = array();

  // Exported role: administrator.
  $roles['administrator'] = array(
    'name' => 'administrator',
    'weight' => 5,
  );

  // Exported role: editor.
  $roles['editor'] = array(
    'name' => 'editor',
    'weight' => 3,
  );

  // Exported role: webmaster.
  $roles['webmaster'] = array(
    'name' => 'webmaster',
    'weight' => 4,
  );

  return $roles;
}
