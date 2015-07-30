<?php

/**
 * @file
 * Drupal Install Profile installion php script.
 */


/**
 * Implements hook_install().
 *
 * Perform actions to set up the site for this profile.
 *
 * @see system_install()
 */
function ggp_net_install() {

  ggp_net_install_theme();
  ggp_net_install_nodes();
  ggp_net_install_blocks();

  return TRUE;
}

/**
 * Enables the themes given in $enable.
 *
 * Themes without key will get a numeric key and will be enabled but not set as variable.
 */
function ggp_net_install_theme() {
  $enable = array(
    'theme_default' => 'ggp_theme',
    'admin_theme' => 'seven',
  );

  theme_enable($enable);
  ggp_net_write_default_at_layout_css($enable['theme_default']);
  foreach ($enable as $var => $theme) {
    if (!is_numeric($var)) {
      variable_set($var, $theme);
    }
  }
  variable_set('node_admin_theme', '1');
  theme_disable(array('bartik'));

  return TRUE;
}

/**
 * Deploy custom nodes.
 */
function ggp_net_install_nodes() {

  $term = new stdClass();
  $term->name = 'Netzwerk';
  // ‘1’ is a vocabulary id you wish this term to assign to.
  $term->vid = 1;
  $term->field_custom_field_name[LANGUAGE_NONE][0]['value'] = 'Netzwerk';
  taxonomy_term_save($term);

  $node = new stdClass();
  $node->type = "article";
  $node->title = "Willkommen auf dieser neuen Seite im Seitenverbund von Global Gameport";
  $node->language = LANGUAGE_NONE;
  $node->name = 'admin';
  // Set some default values thorugh prepare magic.
  node_object_prepare($node);

  $node->body[$node->language][0]['value'] = '<p>Diese Seite ist momentan im Aufbau. Besuche doch einfach eine andere von unseren Seiten. Du kannst sie oben über unsere Netzwerkleiste erreichen.</p>';
  $node->body[$node->language][0]['summary'] = '<p>Diese Seite ist momentan im Aufbau. Besuche doch einfach eine andere von unseren Seiten. Du kannst sie oben über unsere Netzwerkleiste erreichen.</p>';
  $node->body[$node->language][0]['format'] = 'filtered_html';
  $node->field_tags[$node->language][]['tid'] = 1;

  $node = node_submit($node);
  node_save($node);

}

/**
 * Install default blocks.
 */
function ggp_net_install_blocks() {
  $default_theme = 'ggp_theme';
  $admin_theme = 'seven';

  // Enable some standard blocks.
  $blocks = array(
    array(
      'module' => 'system',
      'delta' => 'main',
      'theme' => $default_theme,
      'status' => 1,
      'weight' => 0,
      'region' => 'content',
      'pages' => '',
      'cache' => -1,
    ),
    array(
      'module' => 'system',
      'delta' => 'main-menu',
      'theme' => $default_theme,
      'status' => 1,
      'weight' => -1,
      'region' => 'sidebar_first',
      'pages' => '',
      'cache' => -1,
    ),
    array(
      'module' => 'system',
      'delta' => 'navigation',
      'theme' => $default_theme,
      'status' => 1,
      'weight' => 0,
      'region' => 'sidebar_first',
      'pages' => '',
      'cache' => -1,
    ),
    array(
      'module' => 'system',
      'delta' => 'powered-by',
      'theme' => $default_theme,
      'status' => 1,
      'weight' => 10,
      'region' => 'footer',
      'pages' => '',
      'cache' => -1,
    ),
    array(
      'module' => 'system',
      'delta' => 'help',
      'theme' => $default_theme,
      'status' => 1,
      'weight' => 0,
      'region' => 'help',
      'pages' => '',
      'cache' => -1,
    ),
    array(
      'module' => 'ggp_board',
      'delta' => 'ggp_board',
      'theme' => $default_theme,
      'status' => 1,
      'weight' => 0,
      'region' => 'sidebar_second',
      'pages' => '',
      'cache' => -1,
    ),
    array(
      'module' => 'ggp_header',
      'delta' => 'ggp_social',
      'theme' => $default_theme,
      'status' => 1,
      'weight' => 0,
      'region' => 'header',
      'pages' => '',
      'cache' => -1,
    ),
    array(
      'module' => 'node',
      'delta' => 'recent',
      'theme' => $admin_theme,
      'status' => 1,
      'weight' => 10,
      'region' => 'dashboard_main',
      'pages' => '',
      'cache' => -1,
    ),
    array(
      'module' => 'system',
      'delta' => 'main',
      'theme' => $admin_theme,
      'status' => 1,
      'weight' => 0,
      'region' => 'content',
      'pages' => '',
      'cache' => -1,
    ),
    array(
      'module' => 'system',
      'delta' => 'help',
      'theme' => $admin_theme,
      'status' => 1,
      'weight' => 0,
      'region' => 'help',
      'pages' => '',
      'cache' => -1,
    ),
    array(
      'module' => 'user',
      'delta' => 'login',
      'theme' => $admin_theme,
      'status' => 1,
      'weight' => 10,
      'region' => 'content',
      'pages' => '',
      'cache' => -1,
    ),
    array(
      'module' => 'user',
      'delta' => 'new',
      'theme' => $admin_theme,
      'status' => 1,
      'weight' => 0,
      'region' => 'dashboard_sidebar',
      'pages' => '',
      'cache' => -1,
    ),
    array(
      'module' => 'search',
      'delta' => 'form',
      'theme' => $admin_theme,
      'status' => 1,
      'weight' => -10,
      'region' => 'dashboard_sidebar',
      'pages' => '',
      'cache' => -1,
    ),
  );
  $query = db_insert('block')->fields(
    array('module',
      'delta',
      'theme',
      'status',
      'weight',
      'region',
      'pages',
      'cache'
    )
  );
  foreach ($blocks as $block) {
    $query->values($block);
  }
  $query->execute();

  return TRUE;
}

/**
 * Custom submit function to generate and save the layout css with media queries.
 */
function ggp_net_write_default_at_layout_css($theme) {
  module_load_include('inc', 'system', 'system.admin');
  // Do this to automate saving the theme settings form:
  foreach (array('ggp_theme') as $theme_name) {
    $form_state = form_state_defaults();
    $form_state['build_info']['args'][0] = $theme_name;
    $form_state['values'] = array();
    drupal_form_submit('system_theme_settings', $form_state);
  }
}
