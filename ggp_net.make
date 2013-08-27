; This file was auto-generated by drush_make
core = 7.x
api = 2


; Modules

projects[admin_menu][version] = 3.0-rc4

projects[administerusersbyrole][version] = 1.0-beta1

projects[backports][version] = 1.0-alpha1

projects[ckeditor][version] = 1.13
; projects[ckeditor][patch][] = "http://drupal.org/files/ckeditor-change-to-form-api-args.patch"


projects[ctools][version] = 1.3

projects[disqus][version] = 1.9

projects[fancybox][version] = 2.0-beta2

projects[fontyourface][version] = 2.8

projects[google_webfont_loader_api][version] = 1.10

projects[jquery_update][download][type] = git
projects[jquery_update][download][url] = http://git.drupal.org/project/jquery_update.git
projects[jquery_update][download][tag] = 7.x-2.3-alpha1


projects[linkchecker][version] = 1.1

projects[imce][version] = 1.7

projects[media][version] = 1.3

projects[media_browser_plus][version] = 1.0-beta3

projects[media_gallery][version] = 1.0-beta8
projects[media_gallery][patch][] = "http://raw.github.com/GlobalGameport/ggp_profile/7.x-1.x/media_gallery-7.x-1.0-beta8-collection-fix.patch"

projects[metatag][version] = 1.0-beta7

projects[multiform][version] = 1.0

projects[navigation404][version] = 1.0

projects[pathauto][version] = 1.2

projects[piwik][version] = 2.4

projects[plupload][version] = 1.3


projects[redirect][version] = 1.0-rc1
projects[redirect][patch][] = "https://drupal.org/files/redirect-prevent_circular_redirects_in_hook_path_update-1817976-25_1.patch"

projects[site_verify][version] = 1.0

projects[token][version] = 1.5

projects[transliteration][version] = 3.1

projects[views][version] = 3.7

projects[xmlsitemap][version] = 2.0-rc2

projects[ggp][download][type] = git
projects[ggp][download][url] = http://github.com/GlobalGameport/ggp_module.git
projects[ggp][download][branch] = 7.x-1.x
projects[ggp][type] = module
projects[ggp][version] = 1.x-dev

; Themes
projects[adaptivetheme][download][type] = git
projects[adaptivetheme][download][url] = http://git.drupal.org/project/adaptivetheme.git
projects[adaptivetheme][download][branch] = 7.x-3.x
projects[adaptivetheme][download][revision] = b4b38c3c01d066e733c2942020c51962cd64231c
projects[adaptivetheme][type] = theme

; Please fill the following out. Type may be one of get, cvs, git, bzr or svn,
; and url is the url of the download.
projects[ggp_theme][download][type] = git
projects[ggp_theme][download][url] = http://github.com/GlobalGameport/ggp_theme.git
projects[ggp_theme][download][brnach] = 7.x-1.x
projects[ggp_theme][type] = theme
projects[ggp_theme][version] = 1.x-dev

projects[libraries][version] = 2.1


; Libraries
libraries[ckeditor][download][type] = get
libraries[ckeditor][download][url] = http://download.cksource.com/CKEditor/CKEditor/CKEditor%204.1.1/ckeditor_4.1.1_full.zip
libraries[ckeditor][directory_name] = ckeditor
libraries[ckeditor][type] = library


libraries[plupload][download][type] = get
libraries[plupload][download][url] = http://plupload.com/downloads/plupload_1_5_6.zip
libraries[plupload][directory_name] = plupload
libraries[plupload][type] = library
libraries[plupload][patch][] = "http://drupal.org/files/plupload-1_5_6-rm_examples-1903850-5.patch"

libraries[fancybox][download][type] = get
libraries[fancybox][download][url] = https://github.com/fancyapps/fancyBox/zipball/v2.1.4
libraries[fancybox][directory_name] = fancybox
libraries[fancybox][type] = library
