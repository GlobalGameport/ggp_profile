; This file was auto-generated by drush_make
core = 7.x
api = 2


; Modules

projects[admin_menu][version] = 3.0-rc5
projects[admin_menu][subdir] = "drupalorg"

projects[administerusersbyrole][version] = 2.0-rc1
projects[administerusersbyrole][subdir] = "drupalorg"

projects[backports][version] = 1.0-alpha1
projects[backports][subdir] = "drupalorg"

projects[ckeditor][version] = 1.16
projects[ckeditor][subdir] = "drupalorg"

projects[ctools][version] = 1.7
projects[ctools][subdir] = "drupalorg"

projects[disqus][version] = 1.12
projects[disqus][subdir] = "drupalorg"

projects[fancybox][version] = 2.0-beta6
projects[fancybox][subdir] = "drupalorg"

projects[features][version] = 2.6
projects[features][subdir] = "drupalorg"

projects[google_webfont_loader_api][version] = 1.12
projects[google_webfont_loader_api][subdir] = "drupalorg"

projects[jquery_update][version] = 3.0-alpha2
projects[jquery_update][subdir] = "drupalorg"

projects[linkchecker][version] = 1.2
projects[linkchecker][subdir] = "drupalorg"

projects[imce][version] = 1.9
projects[imce][subdir] = "drupalorg"

projects[imce_mkdir][version] = 1.0
projects[imce_mkdir][subdir] = "drupalorg"

projects[l10n_update][version] = 2.0
projects[l10n_update][subdir] = "drupalorg"

projects[media][version] = 1.5
projects[media][subdir] = "drupalorg"

projects[media_browser_plus][version] = 1.0-beta3
projects[media_browser_plus][subdir] = "drupalorg"

projects[media_gallery][version] = 1.0-beta8
projects[media_gallery][patch][] = "http://raw.github.com/GlobalGameport/ggp_profile/7.x-1.x/media_gallery-7.x-1.0-beta8-collection-fix.patch"
projects[media_gallery][subdir] = "drupalorg"

projects[metatag][version] = 1.7
projects[metatag][subdir] = "drupalorg"

projects[multiform][version] = 1.1
projects[multiform][subdir] = "drupalorg"

projects[navigation404][version] = 1.0
projects[navigation404][subdir] = "drupalorg"

projects[pathauto][version] = 1.2
projects[pathauto][subdir] = "drupalorg"

projects[piwik][version] = 2.7
projects[piwik][subdir] = "drupalorg"

projects[plupload][version] = 1.7
projects[plupload][subdir] = "drupalorg"

projects[redirect][version] = 1.0-rc3
projects[redirect][subdir] = "drupalorg"

projects[site_verify][version] = 1.1
projects[site_verify][subdir] = "drupalorg"

projects[scheduler][version] = 1.3
projects[scheduler][subdir] = "drupalorg"

projects[token][version] = 1.6
projects[token][subdir] = "drupalorg"

projects[transliteration][version] = 3.2
projects[transliteration][subdir] = "drupalorg"

projects[views][version] = 3.11
projects[views][subdir] = "drupalorg"

projects[xmlsitemap][version] = 2.2
projects[xmlsitemap][subdir] = "drupalorg"

projects[joomla][download][type] = git
projects[joomla][download][url] = "https://github.com/GlobalGameport/joomla.git"
projects[joomla][download][branch] = master
projects[joomla][type] = module
projects[joomla][version] = 1.x-dev
projects[joomla][subdir] = "drupalorg"

projects[libraries][version] = 2.2
projects[libraries][subdir] = "drupalorg"

projects[adaptivetheme][download][type] = git
projects[adaptivetheme][download][url] = http://git.drupal.org/project/adaptivetheme.git
projects[adaptivetheme][download][branch] = 7.x-3.x
projects[adaptivetheme][type] = theme


; Libraries
libraries[plupload][download][type] = "get"
libraries[plupload][download][url] = "https://github.com/moxiecode/plupload/archive/v1.5.8.zip"
libraries[plupload][directory_name] = "plupload"
libraries[plupload][type] = "library"
libraries[plupload][patch][] = "https://www.drupal.org/files/issues/plupload-1_5_8-rm_examples-1903850-21.patch"

libraries[fancybox][download][type] = get
libraries[fancybox][download][url] = https://github.com/fancyapps/fancyBox/zipball/v2.1.5
libraries[fancybox][directory_name] = fancybox
libraries[fancybox][type] = library

