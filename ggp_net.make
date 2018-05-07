; This file was auto-generated by drush_make
core = 7.x
api = 2


; Modules

projects[admin_menu][download][type] = git
projects[admin_menu][download][branch] = 7.x-3.x
projects[admin_menu][type] = module
projects[admin_menu][subdir] = "drupalorg"
; See https://www.drupal.org/project/admin_menu/issues/2929025
projects[admin_menu][patch][] = https://www.drupal.org/files/issues/admin-menu-2929025-each-function-deprecated-php-7.2.patch
; See https://www.drupal.org/project/admin_menu/issues/220100#comment-7606103
projects[admin_menu][patch][] = https://www.drupal.org/files/hover-in-delay-94.patch
; See https://www.drupal.org/project/admin_menu/issues/2419055#comment-12215683
projects[admin_menu][patch][] = https://www.drupal.org/files/issues/admin_menu-js-cache-break-menu-fast_404-2419055-12.patch
; See https://www.drupal.org/project/admin_menu/issues/2431015#comment-9648255
projects[admin_menu][patch][] = https://www.drupal.org/files/issues/extra_borders-2431015-1.patch
; See https://www.drupal.org/project/admin_menu/issues/2502695#comment-10053982
projects[admin_menu][patch][] = https://www.drupal.org/files/issues/admin_menu-issetmapfix-2502695-3.patch

projects[administerusersbyrole][version] = 2.0
projects[administerusersbyrole][subdir] = "drupalorg"

projects[ckeditor][version] = 1.18
projects[ckeditor][subdir] = "drupalorg"

projects[ctools][version] = 1.14
projects[ctools][subdir] = "drupalorg"

projects[file_entity][version] = 2.20
projects[file_entity][subdir] = "drupalorg"

projects[disqus][version] = 1.12
projects[disqus][subdir] = "drupalorg"

projects[fancybox][version] = 2.0-beta6
projects[fancybox][subdir] = "drupalorg"

projects[features][version] = 2.10
projects[features][subdir] = "drupalorg"

projects[google_webfont_loader_api][version] = 1.12
projects[google_webfont_loader_api][subdir] = "drupalorg"

projects[jquery_update][version] = 3.0-alpha5
projects[jquery_update][subdir] = "drupalorg"

projects[linkchecker][version] = 1.3
projects[linkchecker][subdir] = "drupalorg"

projects[imce][version] = 1.11
projects[imce][subdir] = "drupalorg"

projects[imce_mkdir][version] = 1.0
projects[imce_mkdir][subdir] = "drupalorg"

projects[l10n_update][version] = 2.2
projects[l10n_update][subdir] = "drupalorg"

projects[media][version] = 2.19
projects[media][subdir] = "drupalorg"


projects[media_oembed][version] = 2.7
projects[media_oembed][subdir] = "drupalorg"

projects[media_ckeditor][version] = 2.5
projects[media_ckeditor][subdir] = "drupalorg"


projects[media_browser_plus][version] = 3.0-beta4
projects[media_browser_plus][subdir] = "drupalorg"

projects[media_gallery][version] = 1.0-beta8
projects[media_gallery][patch][] = "http://raw.github.com/GlobalGameport/ggp_profile/7.x-1.x/media_gallery-7.x-1.0-beta8-collection-fix.patch"
projects[media_gallery][subdir] = "drupalorg"

projects[metatag][version] = 1.25
projects[metatag][subdir] = "drupalorg"

projects[multiform][version] = 1.4
projects[multiform][subdir] = "drupalorg"

projects[navigation404][version] = 1.0
projects[navigation404][subdir] = "drupalorg"

projects[pathauto][version] = 1.3
projects[pathauto][subdir] = "drupalorg"

projects[piwik][version] = 2.10
projects[piwik][subdir] = "drupalorg"

projects[plupload][version] = 1.7
projects[plupload][subdir] = "drupalorg"

projects[redirect][version] = 1.0-rc3
projects[redirect][subdir] = "drupalorg"

projects[site_verify][version] = 1.2
projects[site_verify][subdir] = "drupalorg"

projects[scheduler][version] = 1.5
projects[scheduler][subdir] = "drupalorg"

projects[token][version] = 1.7
projects[token][subdir] = "drupalorg"

projects[transliteration][version] = 3.2
projects[transliteration][subdir] = "drupalorg"

projects[views][version] = 3.20
projects[views][subdir] = "drupalorg"

projects[xmlsitemap][version] = 2.3
projects[xmlsitemap][subdir] = "drupalorg"

projects[libraries][version] = 2.3
projects[libraries][subdir] = "drupalorg"

projects[adaptivetheme][download][type] = git
projects[adaptivetheme][download][url] = http://git.drupal.org/project/adaptivetheme.git
projects[adaptivetheme][download][branch] = 7.x-3.x
projects[adaptivetheme][type] = theme


; Libraries
libraries[plupload][download][type] = file
libraries[plupload][download][url] = "https://github.com/moxiecode/plupload/archive/v1.5.8.zip"
libraries[plupload][directory_name] = "plupload"
libraries[plupload][type] = "library"
libraries[plupload][patch][] = "https://www.drupal.org/files/issues/plupload-1_5_8-rm_examples-1903850-21.patch"

libraries[fancybox][download][type] = file
libraries[fancybox][download][url] = https://github.com/fancyapps/fancyBox/zipball/v2.1.5
libraries[fancybox][directory_name] = fancybox
libraries[fancybox][type] = library



libraries[ckeditor][download][type] = file
libraries[ckeditor][download][url] = http://download.cksource.com/CKEditor/CKEditor/CKEditor%204.9.2/ckeditor_4.9.2_full.zip


libraries[lineutils][download][type] = file
libraries[lineutils][download][url] = http://download.ckeditor.com/lineutils/releases/lineutils_4.9.2.zip
libraries[lineutils][destination] = "libraries/ckeditor/plugins"
