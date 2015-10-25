<?php


// Include Google Fonts Stuff
include_once(drupal_get_path('theme', 'adaptivetheme') . '/inc/google.web.fonts.inc');

// Replace 'adaptivetheme_subtheme' with your themes name, eg:
// function your_themes_name_form_system_theme_settings_alter(&$form, &$form_state)
function ggp_theme_form_system_theme_settings_alter(&$form, &$form_state, $form_id = NULL)  {
  // General "alters" use a form id. Settings should not be set here. The only
  // thing useful about this is if you need to alter the form for the running
  // theme and *not* the theme setting.
  if (isset($form_id)) {
    return;
  }

  // Background Image
  $form['at']['background'] = array(
    '#type' => 'fieldset',
    '#title' => t('Background Image'),
    '#description' => t('<h3>Background Image</h3>'),
  );
  $form['at']['background']['bg_image_path'] = array(
    '#type' => 'textfield',
    '#size' => 60,
    '#titile' => t('Path to custom background image'),
    '#description' => t('The path to the file you would like to use as your background image.'),
    '#value' => theme_get_setting('bg_image_path') ,
  );
  $form['at']['background']['bg_image'] = array(
    '#type' => 'file',
    '#title' => t('Upload background image'),
    '#description' => t('If you don\'t have direct file access to the server, use this field to upload your background image.'),
    '#maxlength' => 40,
  );
  $form['at-settings']['ggp_customization'] = array(
    '#type' => 'fieldset',
    '#title' => t('More customizations...'),
  );

  $form['at-settings']['ggp_customization']['custom_css'] = array(
    '#type'=> 'textarea',
    '#title' => t('Custom CSS'),
    '#description' => t('Set custom CSS which will be included in head'),
  );

  $form['#submit'][] = 'ggp_theme_settings_submit';
  $form['at']['background']['#element_validate'][] = 'ggp_theme_settings_submit';
  return $form;
}
/**
 * Save settings data.
*/
function ggp_theme_settings_submit($form, &$form_state) {
  $settings = array();
  $values = $form_state['values'];


  // Check for a new uploaded file, and use that if available.
  if ($file = file_save_upload('bg_image')) {
    $file->status = FILE_STATUS_PERMANENT;
    if ($image = _ggp_theme_save_image($file)) {
      // Put new image into settings
      $form_state['values']['bg_image_path'] = $image['image_path'];
    }
  }
  $comment = "/* Custom CSS Settings */\n";
  $css_raw = $comment . $values['custom_css'];
  $css = check_plain($css_raw);
  $theme = $form_state['build_info']['args'][0];
  $path = 'public://at_css';
  file_prepare_directory($path, FILE_CREATE_DIRECTORY);

  $file = $theme . '.custom_theme.css';
  $filepath = $path . '/' . $file;
  file_save_data($css, $filepath, FILE_EXISTS_REPLACE);

  variable_set($theme . '_custom_file_path', $path);
  variable_set($theme . '_custom_file_css', $file);
}


function _ggp_theme_save_image($file, $bg_folder = 'public://backgrounds/', $bg_thumb_folder = 'public://backgrounds/thumb/') {
  file_prepare_directory($bg_folder, FILE_CREATE_DIRECTORY);
  file_prepare_directory($bg_thumb_folder, FILE_CREATE_DIRECTORY);

   $parts = pathinfo($file->filename);
  $destination = $bg_folder . $parts['basename'];
  $setting = array();

  $file->status = FILE_STATUS_PERMANENT;

  // Copy temporary image into banner folder
  if ($img = file_copy($file, $destination, FILE_EXISTS_REPLACE)) {
    // Generate image thumb
    $image = image_load($destination);
    $small_img = image_scale($image, 300, 100);
    $image->source = $bg_thumb_folder . $parts['basename'];
    image_save($image);

    // Set image info
    $setting['image_path'] = $destination;

    return $setting;
  }

  return FALSE;
}
