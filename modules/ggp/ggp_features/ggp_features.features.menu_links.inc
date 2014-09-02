<?php
/**
 * @file
 * ggp_features.features.menu_links.inc
 */

/**
 * Implements hook_menu_default_menu_links().
 */
function ggp_features_menu_default_menu_links() {
  $menu_links = array();

  // Exported menu link: main-menu_disclaimer:disclaimer
  $menu_links['main-menu_disclaimer:disclaimer'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'disclaimer',
    'router_path' => 'disclaimer',
    'link_title' => 'Disclaimer',
    'options' => array(
      'attributes' => array(
        'title' => '',
      ),
      'identifier' => 'main-menu_disclaimer:disclaimer',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => -46,
    'customized' => 1,
    'parent_identifier' => 'main-menu_internes:<front>',
  );
  // Exported menu link: main-menu_globalgameportcom:http://www.globalgameport.com/
  $menu_links['main-menu_globalgameportcom:http://www.globalgameport.com/'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'http://www.globalgameport.com/',
    'router_path' => '',
    'link_title' => 'GlobalGameport.com',
    'options' => array(
      'attributes' => array(
        'title' => '',
      ),
      'identifier' => 'main-menu_globalgameportcom:http://www.globalgameport.com/',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 1,
    'has_children' => 1,
    'expanded' => 0,
    'weight' => -45,
    'customized' => 1,
    'parent_identifier' => 'main-menu_internes:<front>',
  );
  // Exported menu link: main-menu_impressum:impressum
  $menu_links['main-menu_impressum:impressum'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'impressum',
    'router_path' => 'impressum',
    'link_title' => 'Impressum',
    'options' => array(
      'attributes' => array(
        'title' => '',
      ),
      'identifier' => 'main-menu_impressum:impressum',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => -47,
    'customized' => 1,
    'parent_identifier' => 'main-menu_internes:<front>',
  );
  // Exported menu link: main-menu_internes:<front>
  $menu_links['main-menu_internes:<front>'] = array(
    'menu_name' => 'main-menu',
    'link_path' => '<front>',
    'router_path' => '',
    'link_title' => 'Internes',
    'options' => array(
      'attributes' => array(
        'title' => '',
      ),
      'identifier' => 'main-menu_internes:<front>',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 1,
    'has_children' => 1,
    'expanded' => 0,
    'weight' => -49,
    'customized' => 1,
  );
  // Exported menu link: main-menu_jobs-bei-ggp:http://www.globalgameport.com/forumdisplay.php?694-GGP-sucht-dich-Mach-mit!
  $menu_links['main-menu_jobs-bei-ggp:http://www.globalgameport.com/forumdisplay.php?694-GGP-sucht-dich-Mach-mit!'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'http://www.globalgameport.com/forumdisplay.php?694-GGP-sucht-dich-Mach-mit!',
    'router_path' => '',
    'link_title' => 'Jobs bei GGP',
    'options' => array(
      'attributes' => array(
        'title' => '',
      ),
      'identifier' => 'main-menu_jobs-bei-ggp:http://www.globalgameport.com/forumdisplay.php?694-GGP-sucht-dich-Mach-mit!',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 1,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => -50,
    'customized' => 1,
    'parent_identifier' => 'main-menu_globalgameportcom:http://www.globalgameport.com/',
  );
  // Exported menu link: main-menu_news-archiv:<front>
  $menu_links['main-menu_news-archiv:<front>'] = array(
    'menu_name' => 'main-menu',
    'link_path' => '<front>',
    'router_path' => '',
    'link_title' => 'News-Archiv',
    'options' => array(
      'attributes' => array(
        'title' => '',
      ),
      'identifier' => 'main-menu_news-archiv:<front>',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 1,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => -50,
    'customized' => 1,
    'parent_identifier' => 'main-menu_internes:<front>',
  );
  // Exported menu link: main-menu_startseite:<front>
  $menu_links['main-menu_startseite:<front>'] = array(
    'menu_name' => 'main-menu',
    'link_path' => '<front>',
    'router_path' => '',
    'link_title' => 'Startseite',
    'options' => array(
      'attributes' => array(
        'title' => '',
      ),
      'identifier' => 'main-menu_startseite:<front>',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 1,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => -50,
    'customized' => 1,
  );
  // Exported menu link: main-menu_team--kontakt:node/2
  $menu_links['main-menu_team--kontakt:node/2'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'node/2',
    'router_path' => 'node/%',
    'link_title' => 'Team & Kontakt',
    'options' => array(
      'identifier' => 'main-menu_team--kontakt:node/2',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => -48,
    'customized' => 1,
    'parent_identifier' => 'main-menu_internes:<front>',
  );
  // Exported menu link: main-menu_umfragen-archiv:poll
  $menu_links['main-menu_umfragen-archiv:poll'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'poll',
    'router_path' => 'poll',
    'link_title' => 'Umfragen-Archiv',
    'options' => array(
      'attributes' => array(
        'title' => '',
      ),
      'identifier' => 'main-menu_umfragen-archiv:poll',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => -49,
    'customized' => 1,
    'parent_identifier' => 'main-menu_internes:<front>',
  );
  // Translatables
  // Included for use with string extractors like potx.
  t('Disclaimer');
  t('GlobalGameport.com');
  t('Impressum');
  t('Internes');
  t('Jobs bei GGP');
  t('News-Archiv');
  t('Startseite');
  t('Team & Kontakt');
  t('Umfragen-Archiv');


  return $menu_links;
}
