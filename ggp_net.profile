<?php
	
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
  return true;
}
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
function ggp_net_install_blocks() {
  $default_theme = 'ggp_theme';
  $admin_theme = 'seven';
  
  $delta = db_insert('block_custom')
    ->fields(array(
      'body' => '<p>Global Gameport ist seit 2006 ein nicht-kommerzielles Fansite Netzwerk mit über 70 Fanseiten im Bereich Gaming.<br>Unsere Mitarbeiter arbeiten alle ehrenamtlich und das Projekt ist komplett Privat finanziert.</p>',
      'info' => 'About GGP',
      'format' => 'filtered_html',
    ))
    ->execute();
    
    $query = db_insert('block')->fields(array('title', 'module', 'delta', 'theme', 'status', 'weight', 'region', 'pages', 'cache'));
        $query->values(array(
          'title' => 'Über Global Gameport',         
          'module' => 'block',
          'delta' => $delta,
          'theme' => $default_theme,
          'status' => 1,
          'weight' => 0,
          'region' => 'three_25_25_50_third',
          'pages' => '',
          'cache' => -1,
        ));
  $query->execute();

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
      'module' => 'comment',
      'delta' => 'recent',
      'theme' => $default_theme,
      'status' => 1,
      'weight' => 0,
      'region' => 'three_25_25_50_first',
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
  $query = db_insert('block')->fields(array('module', 'delta', 'theme', 'status', 'weight', 'region', 'pages', 'cache'));
  foreach ($blocks as $block) {
    $query->values($block);
  }
  $query->execute();
}
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
function ggp_net_install_taxonomy() {
  // Create a default vocabulary named "Tags", enabled for the 'article' content type.
  $description = st('Use tags to group articles on similar topics into categories.');
  $help = st('Enter a comma-separated list of words to describe your content.');
  if(!taxonomy_vocabulary_machine_name_load('tags')) {
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
		'cardinality' => FIELD_CARDINALITY_UNLIMITED,
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
		  'weight' => -4,
		),
		'display' => array(
		  'default' => array(
			'type' => 'taxonomy_term_reference_link',
			'weight' => 10,
		  ),
		  'teaser' => array(
			'type' => 'taxonomy_term_reference_link',
			'weight' => 10,
		  ),
		),
	  );
	  field_create_instance($instance);
	}
}
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
function ggp_net_install_roles($filtered_html_format) {
  // Enable default permissions for system roles.
  $filtered_html_permission = filter_permission_name($filtered_html_format);
  user_role_grant_permissions(DRUPAL_ANONYMOUS_RID, array('access content', $filtered_html_permission));
  user_role_grant_permissions(DRUPAL_AUTHENTICATED_RID, array('access content', $filtered_html_permission));

  // Create a default role for site administrators, with all available permissions assigned.
  $admin_role = new stdClass();
  $admin_role->name = 'administrator';
  $admin_role->weight = 2;
  user_role_save($admin_role);
  user_role_grant_permissions($admin_role->rid, array_keys(module_invoke_all('permission')));
  // Set this as the administrator role.
  variable_set('user_admin_role', $admin_role->rid);

  // Assign user 1 the "administrator" role.
  db_insert('users_roles')
    ->fields(array('uid' => 1, 'rid' => $admin_role->rid))
    ->execute();
}
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
}
function ggp_net_install_theme() {
    // Any themes without keys here will get numeric keys and so will be enabled,
  // but not placed into variables.
  $enable = array(
    'theme_default' => 'ggp_theme',
    'admin_theme' => 'seven',
    //'zen'
  );
  
  theme_enable($enable);
  ggp_net_write_default_at_layout_css($enable['theme_default']);
  foreach ($enable as $var => $theme) {
    if (!is_numeric($var)) {
      variable_set($var, $theme);
    }
  }
  variable_set('node_admin_theme', '1');
   
   
  // Disable the default Bartik theme
  theme_disable(array('bartik'));
    
}
function ggp_net_install_nodes() {

$term = new stdClass();
$term->name = 'Netzwerk';
$term->vid = 1; // ‘1’ is a vocabulary id you wish this term to assign to
$term->field_custom_field_name[LANGUAGE_NONE][0]['value'] = 'Netzwerk'; // OPTIONAL. If your term has a custom field attached it can added as simple as this
taxonomy_term_save($term); // Finally, save our term

$node = new stdClass(); // We create a new node object
$node->type = "article"; // Or any other content type you want
$node->title = "Willkommen auf dieser neuen Seite im Seitenverbund von Global Gameport";
$node->language = LANGUAGE_NONE; // Or any language code if Locale module is enabled. More on this below *
$node->uid = 1; // Or any id you wish
node_object_prepare($node); // Set some default values.


// Let's add standard body field
$node->body[$node->language][0]['value'] = '<p>Diese Seite ist momentan im Aufbau. Besuche doch einfach eine andere von unseren Seiten. Du kannst sie oben über unsere Netzwerkleiste erreichen.</p>';
$node->body[$node->language][0]['summary'] = '<p>Diese Seite ist momentan im Aufbau. Besuche doch einfach eine andere von unseren Seiten. Du kannst sie oben über unsere Netzwerkleiste erreichen.</p>';
$node->body[$node->language][0]['format'] = 'filtered_html'; // If field has a format, you need to define it. Here we define a default filtered_html format for a body field

$node->field_tags[$node->language][]['tid'] = 1;

$node = node_submit($node); // Prepare node for a submit
node_save($node); // After this call we'll get a nid

}
function ggp_net_install_vars() {
  $vars = array();
  $vars['colorbox_style'] = "profiles/ggp_net/libraries/colorbox/example5";
  $vars['ggp_board_settings'] = array();
  $vars['ggp_board_settings']['board_url'] = "www.globalgameport.com";
  $vars['ggp_board_settings']['maxposts'] = "5";
  $vars['ggp_board_settings']['ids'] = "0";
  $vars['ggp_board_settings']['more'] = "";


  $vars['date_default_timezone'] = "System/Localtime";
  $vars['date_format_long'] = "l, j. F Y - G:i";
  $vars['date_format_medium']= "D, d/m/Y - H:i";
  $vars['date_format_short'] = "j M Y - H:i";


  $vars['pathauto_node_pattern'] = '[node:menu-link:parents:join-path]/[node:menu-link]';
  $vars['pathauto_node_article_pattern'] = 'news/[node:created:custom:Y]/[node:created:custom:m]/[node:created:custom:d]/[node:title]';


  $vars['site_footer'] = 'GGP.NET';

  foreach ($vars as $key => $val) {
      variable_set($key, $val);
  } 



// Assign user 1 the "administrator" role.
  db_update('ckeditor_settings')
    ->fields(array(
      'settings' => 'a:10:{s:4:"skin";s:4:"kama";s:13:"ckeditor_path";s:36:"/profiles/ggp_net/libraries/ckeditor";s:19:"ckeditor_local_path";s:37:"./profiles/ggp_net/libraries/ckeditor";s:21:"ckeditor_plugins_path";s:44:"/profiles/ggp_net/libraries/ckeditor/plugins";s:27:"ckeditor_plugins_local_path";s:45:"./profiles/ggp_net/libraries/ckeditor/plugins";s:13:"ckfinder_path";s:0:"";s:19:"ckfinder_local_path";s:0:"";s:18:"ckeditor_aggregate";s:1:"f";s:14:"toolbar_wizard";s:1:"t";s:11:"loadPlugins";a:0:{}}'))
    ->condition('name', 'CKEditor Global Profile')
    ->execute();


  return 1;
}

// Custom submit function to generate and save the layout css with media queries
function ggp_net_write_default_at_layout_css($theme) {

 //Tablet layout - landscape
  $sidebar_first  = theme_get_setting('tablet_landscape_sidebar_first', $theme);
  $sidebar_second = theme_get_setting('tablet_landscape_sidebar_second', $theme);
  $media_query    = theme_get_setting('tablet_landscape_media_query', $theme);
  $page_width     = theme_get_setting('tablet_landscape_page_width', $theme);
  $method         = theme_get_setting('tablet_landscape_layout', $theme);
  $sidebar_unit   = theme_get_setting('tablet_landscape_sidebar_unit', $theme);
  $page_unit      = theme_get_setting('tablet_landscape_page_unit', $theme);
  $layout         = ggp_net_at_layout_styles($method, $sidebar_first, $sidebar_second, $sidebar_unit);
  $comment        = "/* Tablet landscape $method */\n";
  $width          = "\n" . '.container {width: ' . $page_width . $page_unit . ';}';

  if (theme_get_setting('tablet_landscape_set_max_width', $theme) == 1 && $page_unit == '%') {
    $max_width = theme_get_setting('tablet_landscape_max_width', $theme);
    $max_width_unit = theme_get_setting('tablet_landscape_max_width_unit', $theme);
    if (!empty($max_width)) {
      $width = "\n" . '.container {width: ' . $page_width . $page_unit . '; max-width: ' . $max_width . $max_width_unit . ';}';
    }
    else {
      $width = "\n" . '.container {width: ' . $page_width . $page_unit . '; max-width: ' . $page_width . $page_unit . ';}';
    }
  }

  $styles = implode("\n", $layout) . $width;
  $css = $comment . '@media ' . $media_query . ' {' . "\n" . $styles . "\n" . '}';
  $layouts[] = check_plain($css);
    
  // Standard bigscreen layout
  $sidebar_first  = theme_get_setting('bigscreen_sidebar_first', $theme);
  $sidebar_second = theme_get_setting('bigscreen_sidebar_second', $theme);
  $media_query    = theme_get_setting('bigscreen_media_query', $theme);
  $page_width     = theme_get_setting('bigscreen_page_width', $theme);
  $method         = theme_get_setting('bigscreen_layout', $theme);
  $sidebar_unit   = theme_get_setting('bigscreen_sidebar_unit', $theme);
  $page_unit      = theme_get_setting('bigscreen_page_unit', $theme);
  $layout         = ggp_net_at_layout_styles($method, $sidebar_first, $sidebar_second, $sidebar_unit);
  $comment        = "/* Standard layout $method */\n";
  $width          = "\n" . '.container {width: '. $page_width . $page_unit . ';}';

  if (theme_get_setting('bigscreen_set_max_width', $theme) == 1 && $page_unit == '%') {
    $max_width = theme_get_setting('bigscreen_max_width', $theme);
    $max_width_unit = theme_get_setting('bigscreen_max_width_unit', $theme);
    if (!empty($max_width)) {
      $width = "\n" . '.container {width: ' . $page_width . $page_unit . '; max-width: ' . $max_width . $max_width_unit . ';}';
    }
    else {
      $width = "\n" . '.container {width: ' . $page_width . $page_unit . '; max-width: ' . $page_width . $page_unit . ';}';
    }
  }

  $styles = implode("\n", $layout) . $width;
  $css = $comment . '@media ' . $media_query . ' {' . "\n" . $styles . "\n" . '}';
  $layouts[] = check_plain($css);
  $layout_data = implode("\n", $layouts);
  

  // Build and save files
  $path  = "public://at_css";
  file_prepare_directory($path, FILE_CREATE_DIRECTORY);

// IE
  $lt_ie9_layout_file     = $theme . '.lt-ie9.layout.css';
  $lt_ie9_layout_data     = $lt_ie9;
  $lt_ie9_layout_filepath = $path . '/' . $lt_ie9_layout_file;
  file_save_data($lt_ie9_layout_data, $lt_ie9_layout_filepath, FILE_EXISTS_REPLACE);

  // Responsive layout
  $responsive_layout_file     = $theme . '.responsive.layout.css';
  $responsive_layout_data     = $layout_data;
  $responsive_layout_filepath = $path . '/' . $responsive_layout_file;
  file_save_data($responsive_layout_data, $responsive_layout_filepath, FILE_EXISTS_REPLACE);

  // set variables so we can retrive them later to load the css files
  variable_set($theme . '_ltie9_layout_file_path', $path);
  variable_set($theme . '_ltie9_layout_file_css', $lt_ie9_layout_file);
  variable_set($theme . '_responsive_layout_file_path', $path);
  variable_set($theme . '_responsive_layout_file_css', $responsive_layout_file);
}

// Process layout styles
function ggp_net_at_layout_styles($method, $sidebar_first, $sidebar_second, $sidebar_unit) {

  // Set variables for language direction
  $left = 'left';
  $right = 'right';

  // build the sytle arrays, params are passed to the function from preprocess_html
  $styles = array();
  if ($method == 'three-col-grail') {
    $sidebar_second = $sidebar_second . $sidebar_unit;
    $sidebar_first  = $sidebar_first . $sidebar_unit;
    $push_right = $sidebar_second;
    $push_left  = $sidebar_first;
    $pull_right = $sidebar_second;
    $styles[] = '.two-sidebars .content-inner {margin-' . $left . ': ' . $push_left . '; margin-' . $right . ': ' . $push_right . ';}';
    $styles[] = '.sidebar-first .content-inner {margin-' . $left . ': ' . $push_left . '; margin-' . $right . ': 0;}';
    $styles[] = '.sidebar-second .content-inner {margin-' . $right . ': ' . $push_right . '; margin-' . $left . ': 0;}';
    $styles[] = '.region-sidebar-first {width: ' . $sidebar_first . '; margin-' . $left . ': -100%;}';
    $styles[] = '.region-sidebar-second {width: ' . $sidebar_second . '; margin-' . $left . ': -' . $pull_right . '; clear: none;}';
  }
  if ($method == 'three-col-right') {
    $content_margin = $sidebar_second + $sidebar_first . $sidebar_unit;
    $push_right     = $sidebar_second . $sidebar_unit;
    $push_left      = $sidebar_first . $sidebar_unit;
    $left_margin    = $sidebar_second + $sidebar_first . $sidebar_unit;
    $right_margin   = $sidebar_second . $sidebar_unit;
    $styles[] = '.two-sidebars .content-inner {margin-' . $right . ': ' . $content_margin . '; margin-' . $left . ': 0;}';
    $styles[] = '.sidebar-first .content-inner {margin-' . $right . ': ' . $push_left . '; margin-' . $left . ': 0;}';
    $styles[] = '.sidebar-second .content-inner {margin-' . $right . ': ' . $push_right . '; margin-' . $left . ': 0;}';
    $styles[] = '.region-sidebar-first {width: ' . $sidebar_first . $sidebar_unit . '; margin-' . $left . ': -' . $left_margin . ';}';
    $styles[] = '.region-sidebar-second {width: ' . $sidebar_second . $sidebar_unit . '; margin-' . $left . ': -' . $right_margin . '; clear: none;}';
    $styles[] = '.sidebar-first .region-sidebar-first {width: ' . $sidebar_first . $sidebar_unit . '; margin-' . $left . ': -' . $sidebar_first . $sidebar_unit . ';}';
  }
  if ($method == 'three-col-left') {
    $content_margin = $sidebar_second + $sidebar_first . $sidebar_unit;
    $left_margin    = $sidebar_first . $sidebar_unit;
    $right_margin   = $sidebar_second . $sidebar_unit;
    $push_right     = $sidebar_first . $sidebar_unit;
    $styles[] = '.two-sidebars .content-inner {margin-' . $left . ': ' . $content_margin . '; margin-' . $right . ': 0;}';
    $styles[] = '.sidebar-first .content-inner {margin-' . $left . ': ' . $left_margin . '; margin-' . $right . ': 0;}';
    $styles[] = '.sidebar-second .content-inner {margin-' . $left . ': ' . $right_margin . '; margin-' . $right . ': 0;}';
    $styles[] = '.region-sidebar-first {width: ' . $sidebar_first . $sidebar_unit . '; margin-' . $left . ': -100%;}';
    $styles[] = '.region-sidebar-second {width: ' . $sidebar_second . $sidebar_unit . '; margin-' . $left . ': -100%; clear: none;}';
    $styles[] = '.two-sidebars .region-sidebar-second {width: ' . $sidebar_second . $sidebar_unit . '; position: relative; ' . $left . ': ' . $push_right . ' ;}';
  }
  if ($method == 'two-col-stack') {
    $push_right = $sidebar_first . $sidebar_unit;
    $styles[] = '.two-sidebars .content-inner,.sidebar-first .content-inner {margin-' . $left . ': 0; margin-' . $right . ': ' . $push_right . ';}';
    $styles[] = '.sidebar-second .content-inner {margin-right: 0; margin-left: 0;}';
    $styles[] = '.region-sidebar-first {width: ' . $sidebar_first . $sidebar_unit . '; margin-' . $left . ': -' . $push_right . ';}';
    $styles[] = '.region-sidebar-second {width: 100%; margin-left: 0; margin-right: 0; margin-top: 20px; clear: both; overflow: hidden;}';
    $styles[] = '.region-sidebar-second .block {float: left; clear: none;}';
  }
  if ($method == 'one-col-stack') {
    $styles[] = '.two-sidebars .content-inner,.one-sidebar .content-inner,.region-sidebar-first,.region-sidebar-second {margin-left: 0; margin-right: 0;}';
    $styles[] = '.region-sidebar-first, .region-sidebar-second, .region-sidebar-first .block, .region-sidebar-second .block {width: 100%;}';
    $styles[] = '.region-sidebar-second {width: 100%;}';
    $styles[] = '.content-inner,.region-sidebar-first,.region-sidebar-second {float: none;}';
    $styles[] = '.region-sidebar-first, .region-sidebar-second {clear: both;}';
  }
  if ($method == 'one-col-vert') {
    $one_sidebar = $sidebar_first + $sidebar_second;
    $styles[] = '.two-sidebars .content-inner,.one-sidebar .content-inner,.region-sidebar-first,.region-sidebar-second {margin-left: 0; margin-right: 0;}';
    $styles[] = '.region-sidebar-first {width: ' . $sidebar_first . $sidebar_unit . ';}';
    $styles[] = '.region-sidebar-second {width: ' . $sidebar_second . $sidebar_unit . ';}';
    $styles[] = '.one-sidebar .sidebar {width: ' . $one_sidebar . $sidebar_unit . ';}';
    $styles[] = '.region-sidebar-first, .region-sidebar-second {overflow: hidden; margin-top: 20px;}';
    $styles[] = '.region-sidebar-first .block, .region-sidebar-second .block {width: 100%;}';
  }
  return $styles;
}
