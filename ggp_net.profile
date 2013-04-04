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
  $formats = ggp_net_install_formats();
  ggp_net_install_blocks();
  ggp_net_install_node_types();
  ggp_net_install_taxonomy();
  ggp_net_install_fields();
  ggp_net_install_roles($formats['filtered_html_format']);
  ggp_net_install_menu();

  ggp_net_install_vars();
  ggp_net_install_nodes();
  return TRUE;
}
/**
 * Installs default text formats.
 *
 * @return array
 *   Array of format link. e.g: array('format1' => array('name' => 'Format 1', 'weight' => 0 ...)).
 */
function ggp_net_install_formats() {
  // Add text formats.
  $filtered_html_format = array(
    'format' => 'filtered_html',
    'name' => 'Filtered HTML',
    'weight' => 0,
    'filters' => array(
      // URL filter.
      'filter_url' => array(
        'weight' => 0,
        'status' => 1,
      ),
      // HTML filter.
      'filter_html' => array(
        'weight' => 1,
        'status' => 1,
      ),
      // Line break filter.
      'filter_autop' => array(
        'weight' => 2,
        'status' => 1,
      ),
      // HTML corrector filter.
      'filter_htmlcorrector' => array(
        'weight' => 10,
        'status' => 1,
      ),
    ),
  );
  $filtered_html_format = (object) $filtered_html_format;
  filter_format_save($filtered_html_format);

  $full_html_format = array(
    'format' => 'full_html',
    'name' => 'Full HTML',
    'weight' => 1,
    'filters' => array(
      // URL filter.
      'filter_url' => array(
        'weight' => 0,
        'status' => 1,
      ),
      // Line break filter.
      'filter_autop' => array(
        'weight' => 1,
        'status' => 1,
      ),
      // HTML corrector filter.
      'filter_htmlcorrector' => array(
        'weight' => 10,
        'status' => 1,
      ),
    ),
  );
  $full_html_format = (object) $full_html_format;
  filter_format_save($full_html_format);
  return array('filtered_html_format' => $filtered_html_format, 'full_html_format' => $full_html_format);
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
 * Create ome default rdf mappings.
 */
function ggp_net_install_node_types() {
  // Insert default pre-defined node types into the database. For a complete
  // list of available node type attributes, refer to the node type API
  // documentation at: http://api.drupal.org/api/HEAD/function/hook_node_info.
  $types = array(
    array(
      'type' => 'page',
      'name' => st('Basic page'),
      'base' => 'node_content',
      'description' => st("Use <em>basic pages</em> for your static content, such as an 'About us' page."),
      'custom' => 1,
      'modified' => 1,
      'locked' => 0,
    ),
    array(
      'type' => 'article',
      'name' => st('Article'),
      'base' => 'node_content',
      'description' => st('Use <em>articles</em> for time-sensitive content like news, press releases or blog posts.'),
      'custom' => 1,
      'modified' => 1,
      'locked' => 0,
    ),
  );

  foreach ($types as $type) {
    $type = node_type_set_defaults($type);
    node_type_save($type);
    node_add_body_field($type);
  }

  // Insert default pre-defined RDF mapping into the database.
  $rdf_mappings = array(
    array(
      'type' => 'node',
      'bundle' => 'page',
      'mapping' => array(
        'rdftype' => array('foaf:Document'),
      ),
    ),
    array(
      'type' => 'node',
      'bundle' => 'article',
      'mapping' => array(
        'field_image' => array(
          'predicates' => array('og:image', 'rdfs:seeAlso'),
          'type' => 'rel',
        ),
        'field_tags' => array(
          'predicates' => array('dc:subject'),
          'type' => 'rel',
        ),
      ),
    ),
  );
  foreach ($rdf_mappings as $rdf_mapping) {
    rdf_mapping_save($rdf_mapping);
  }

  // Default "Basic page" to not be promoted and have comments disabled.
  variable_set('node_options_page', array('status'));

  // Don't display date and author information for "Basic page" nodes by default.
  variable_set('node_submitted_page', FALSE);

}

/**
 * Create Vocabularies.
 */
function ggp_net_install_taxonomy() {
  // Create a default vocabulary named "Tags", enabled for the 'article' content type.
  $description = st('Use tags to group articles on similar topics into categories.');
  $help = st('Enter a comma-separated list of words to describe your content.');
  if (!taxonomy_vocabulary_machine_name_load('tags')) {
    $vocabulary = (object) array(
      'name' => st('Tags'),
      'description' => $description,
      'machine_name' => 'tags',
      'help' => $help,
    );
    taxonomy_vocabulary_save($vocabulary);

    $field = array(
      'field_name' => 'field_' . $vocabulary->machine_name,
      'type' => 'taxonomy_term_reference',
      // Set cardinality to unlimited for tagging.
      'cardinality' => 1,
      'settings' => array(
        'allowed_values' => array(
          array(
            'vocabulary' => $vocabulary->machine_name,
            'parent' => 0,
          ),
        ),
      ),
    );
    field_create_field($field);

    $instance = array(
      'field_name' => 'field_' . $vocabulary->machine_name,
      'entity_type' => 'node',
      'label' => 'Tags',
      'bundle' => 'article',
      'description' => $vocabulary->help,
      'widget' => array(
        'type' => 'taxonomy_autocomplete',
        'weight' => 5,
      ),
      'display' => array(
        'default' => array(
          'type' => 'taxonomy_term_reference_link',
          'label' => 'hidden',
        ),
        'teaser' => array(
          'type' => 'taxonomy_term_reference_link',
          'label' => 'hidden',
        ),
      ),
    );
    field_create_instance($instance);
  }

  // Create Categories.
  $description = st('Use categories to categorize them.');
  $help = st('Select a Category.');
  $vocabulary = (object) array(
    'name' => st('Categories'),
    'description' => $description,
    'machine_name' => 'categories',
    'help' => $help,
  );
  taxonomy_vocabulary_save($vocabulary);

  $names = array(
    t('Newtork'),
    t('Site'),
  );

  $weight = -15;
  foreach ($names as $name) {
    $term = (object) array(
      'name' => $name,
      'vid' => $vocabulary->vid,
      'weight' => $weight,
    );
    taxonomy_term_save($term);
    $weight += 5;
    $terms[$name] = $term->tid;
  }

  $field = array(
    'field_name' => 'field_' . $vocabulary->machine_name,
    'type' => 'taxonomy_term_reference',
    // Set cardinality to unlimited for tagging.
    'cardinality' => 1,
    'settings' => array(
      'allowed_values' => array(
        array(
          'vocabulary' => $vocabulary->machine_name,
          'parent' => 0,
        ),
      ),
    ),
  );
  field_create_field($field);

  $instance = array(
    'field_name' => 'field_' . $vocabulary->machine_name,
    'entity_type' => 'node',
    'label' => 'Category',
    'bundle' => 'article',
    'description' => $vocabulary->help,
    'widget' => array(
      'type' => 'options_select',
      'weight' => 4,
    ),
    'display' => array(
      'default' => array(
        'type' => 'taxonomy_term_reference_link',
        'label' => 'hidden',
      ),
      'teaser' => array(
        'type' => 'taxonomy_term_reference_link',
        'label' => 'hidden',
      ),
    ),
  );
  field_create_instance($instance);
}

/**
 * Create fields.
 */
function ggp_net_install_fields() {
  // Create an image field named "Image", enabled for the 'article' content type.
  // Many of the following values will be defaulted, they're included here as an illustrative examples.
  // See http://api.drupal.org/api/function/field_create_field/7
  $field = array(
    'field_name' => 'field_image',
    'type' => 'image',
    'cardinality' => 1,
    'locked' => FALSE,
    'indexes' => array('fid' => array('fid')),
    'settings' => array(
      'uri_scheme' => 'public',
      'default_image' => FALSE,
    ),
    'storage' => array(
      'type' => 'field_sql_storage',
      'settings' => array(),
    ),
  );
  field_create_field($field);

  // Many of the following values will be defaulted, they're included here as an illustrative examples.
  // See http://api.drupal.org/api/function/field_create_instance/7
  $instance = array(
    'field_name' => 'field_image',
    'entity_type' => 'node',
    'label' => 'Image',
    'bundle' => 'article',
    'description' => st('Upload an image to go with this article.'),
    'required' => FALSE,

    'settings' => array(
      'file_directory' => 'field/image',
      'file_extensions' => 'png gif jpg jpeg',
      'max_filesize' => '',
      'max_resolution' => '',
      'min_resolution' => '',
      'alt_field' => TRUE,
      'title_field' => '',
    ),

    'widget' => array(
      'type' => 'image_image',
      'settings' => array(
        'progress_indicator' => 'throbber',
        'preview_image_style' => 'thumbnail',
      ),
      'weight' => -1,
    ),

    'display' => array(
      'default' => array(
        'label' => 'hidden',
        'type' => 'image',
        'settings' => array('image_style' => 'large', 'image_link' => ''),
        'weight' => -1,
      ),
      'teaser' => array(
        'label' => 'hidden',
        'type' => 'image',
        'settings' => array('image_style' => 'medium', 'image_link' => 'content'),
        'weight' => -1,
      ),
    ),
  );
  field_create_instance($instance);
}

/**
 * Installs the default role administrator and set permissions.
 *
 * @param array $filtered_html_format
 *   Array of previously set text filters.
 */
function ggp_net_install_roles($filtered_html_format) {
  // Enable default permissions for system roles.
  $filtered_html_permission = filter_permission_name($filtered_html_format);
  user_role_grant_permissions(DRUPAL_ANONYMOUS_RID, array('access content', $filtered_html_permission));
  user_role_grant_permissions(DRUPAL_AUTHENTICATED_RID, array('access content', $filtered_html_permission));

  // Create a default role for site administrators, with all available permissions assigned.
  $admin_role = new stdClass();
  $admin_role->name = 'administrator';
  $admin_role->weight = 5;
  user_role_save($admin_role);
  user_role_grant_permissions($admin_role->rid, array_keys(module_invoke_all('permission')));
  // Set this as the administrator role.
  variable_set('user_admin_role', $admin_role->rid);

  // Assign user 1 the "administrator" role.
  db_insert('users_roles')
    ->fields(array('uid' => 1, 'rid' => $admin_role->rid))
    ->execute();

  // Create Webmaster and Editor Roles.
  $roles = array();
  $roles['editor'] = array(
    'weight' => 3,
    'permissions' => array_merge(
      array('access content', $filtered_html_permission),
      ggp_net_permissions('editor')
    )
  );
  $roles['webmaster'] = array(
    'weight' => 4,
    'permissions' => array_merge(
      array('access content', $filtered_html_permission),
      ggp_net_permissions('webmaster')
    )
  );
  foreach ($roles as $name => $role) {
    $r = new stdClass();
    $r->name = $name;
    $r->weight = $role['weight'];
    user_role_save($r);
    user_role_grant_permissions($r->rid, $role['permissions']);
  }
}

/**
 * Place some default links in main-menu.
 */
function ggp_net_install_menu() {
  // Create a Home link in the main menu.
  $item = array(
    'link_title' => st('Home'),
    'link_path' => '<front>',
    'menu_name' => 'main-menu',
  );
  menu_link_save($item);

  // Update the menu router information.
  menu_rebuild();

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
 * Set install profiles variables.
 */
function ggp_net_install_vars() {
  $vars = array();
  $vars['ggp_board_settings'] = array();
  $vars['ggp_board_settings']['board_url'] = "www.globalgameport.com";
  $vars['ggp_board_settings']['maxposts'] = "5";
  $vars['ggp_board_settings']['ids'] = "0";
  $vars['ggp_board_settings']['more'] = "";

  $vars['date_default_timezone'] = "System/Localtime";
  $vars['date_format_long'] = "l, j. F Y - G:i";
  $vars['date_format_medium'] = "D, d/m/Y - H:i";
  $vars['date_format_short'] = "j M Y - H:i";

  $vars['jquery_update_jquery_version'] = "1.7";
  $vars["jquery_update_jquery_cdn"] = "google";
  $vars['fancybox_settings'] = variable_get('fancybox_settings');
  $vars['fancybox_settings']['settings']['selectors'] = ".fancybox";
  $vars['fancybox_settings']['helpers']['overlay']['locked'] = 0;
  $vars['fancybox_settings']['helpers']['title']['type'] = 'inside';
  $vars['fancybox_settings']['helpers']['buttons_enabled'] = 1;
  $vars['fancybox_settings']['helpers']['buttons']['position'] = 'bottom';
  $vars['fancybox_settings']['helpers']['media_enabled'] = 1;

  $vars['user_register'] = USER_REGISTER_ADMINISTRATORS_ONLY;
  $vars['pathauto_node_pattern'] = '[node:menu-link:parents:join-path]/[node:menu-link]';
  $vars['pathauto_node_article_pattern'] = 'news/[node:created:custom:Y]/[node:created:custom:m]/[node:created:custom:d]/[node:title]';

  foreach ($vars as $key => $val) {
    variable_set($key, $val);
  }

  // Set CKEditor Library Path.
  module_load_include('inc', 'ckeditor', 'ckeditor.admin');
  // Do this to automate saving the theme settings form:
  $form_state = form_state_defaults();
  $form_state['build_info']['args'][0] = 'edit';
  $form_state['values'] = array();
  $form_state['values']['ckeditor_path'] = "/profiles/ggp_net/libraries/ckeditor";
  $form_state['values']['ckeditor_local_path'] = "./profiles/ggp_net/libraries/ckeditor";
  $form_state['values']['ckeditor_plugins_path'] = "/profiles/ggp_net/libraries/ckeditor/plugins";
  $form_state['values']['ckeditor_plugins_local_path'] = "./profiles/ggp_net/libraries/ckeditor/plugins";

  drupal_form_submit('ckeditor_admin_global_profile_form', $form_state);

  // Set IMCE as File Browser.
  $form_state = form_state_defaults();
  $form_state['build_info']['args'][0] = 'Full';
  $form_state['values'] = array();
  $form_state['values']['filebrowser'] = "imce";

  drupal_form_submit('ckeditor_admin_profile_form', $form_state);

  $form_state = form_state_defaults();
  $form_state['build_info']['args'][0] = 'Advanced';

  drupal_form_submit('ckeditor_admin_profile_form', $form_state);

  module_load_include('inc', 'node', 'content_types');
  // Do this to automate saving the theme settings form:
  foreach (array('page', 'article') as $content_type_name) {
    $form_state = form_state_defaults();
    $form_state['build_info']['args'][0] = node_type_load($content_type_name);
    $form_state['values'] = array();
    $form_state['values']['xmlsitemap']['status'] = 1;
    drupal_form_submit('node_type_form', $form_state);
  }

  return TRUE;
}

/**
 * Custom submit function to generate and save the layout css with media queries.
 */
function ggp_net_write_default_at_layout_css($theme) {
  module_load_include('inc', 'system', 'system.admin');
  // Do this to automate saving the theme settings form:
  foreach (array('adaptivetheme', 'ggp_theme') as $theme_name) {
    $form_state = form_state_defaults();
    $form_state['build_info']['args'][0] = $theme_name;
    $form_state['values'] = array();
    drupal_form_submit('system_theme_settings', $form_state);
  }
}

/**
 * Return permissions for given role.
 */
function ggp_net_permissions($role) {
  $permissions = array();
  switch ($role) {
    case 'editor':
      $permissions = array(
        'create page content',
        'edit any page content',
        'edit own page content',
        'delete own page content',
        'create article content',
        'edit any article content',
        'edit own article content',
        'delete own article content',
        'create media_gallery content',
        'edit any media_gallery content',
        'edit any media_gallery content',
        'delete own media_gallery content',
        'use text format full_html',
        'access administration pages',
        'access content',
        'access content overview',
        'access dashboard',
        'access overlay',
        'access contextual links',
        'access site in maintenance mode',
        'access toolbar',
        'administer media',
        'administer media galleries',
        'administer menu',
        'administer nodes',
        'administer shortcuts',
        'administer taxonomy',
        'create url aliases',
        'customize shortcut links',
        'customize ckeditor',
        'edit terms in 1',
        'edit terms in 2',
        'edit terms in 3',
        'view revisions',
        'view media',
        'view the administration theme',
        'view own unpublished content',
      );
      break;
    case 'webmaster':
      $permissions = array(
        'bypass node access',
        'delete any page content',
        'delete any article content',
        'delete any media_gallery content',
        'revert revisions',
        'administer url aliases',
        'administer piwik',
        'administer xmlsitemap',
        'administer blocks',
        'administer ckeditor',
        'administer modules',
        'administer site configuration',
        'administer themes',
      );
      $permissions = array_merge(ggp_net_permissions('editor'), $permissions);
      break;
  }
  return $permissions;
}
