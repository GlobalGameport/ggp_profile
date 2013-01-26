; This file was auto-generated by drush_make
core = 7.x
api = 2


; Modules
projects[backports][version] = 1.0-alpha1

projects[ckeditor][version] = 1.12

projects[ctools][version] = 1.2

projects[fancybox][version] = 2.0-alpha2

projects[jquery_update][download][type] = git
projects[jquery_update][download][url] = http://git.drupal.org/project/jquery_update.git
projects[jquery_update][download][tag] = 7.x-2.3-alpha1

projects[media][version] = 1.2

projects[media_browser_plus][version] = 1.0-beta3

projects[media_gallery][version] = 1.0-beta8
projects[media_gallery][patch][] = "http://raw.github.com/GlobalGameport/ggp_profile/7.x-1.x/media_gallery-7.x-1.0-beta8-collection-fix.patch"

projects[metatag][version] = 1.0-beta4

projects[multiform][version] = 1.0

projects[navigation404][version] = 1.0

projects[pathauto][version] = 1.2

projects[piwik][version] = 2.4

projects[plupload][version] = 1.0

projects[redirect][version] = 1.0-rc1

projects[site_verify][version] = 1.0

projects[token][version] = 1.4

projects[transliteration] = 3.1

projects[views][version] = 3.5

projects[xmlsitemap][version] = 2.0-rc2

projects[ggp][download][type] = git
projects[ggp][download][url] = http://github.com/GlobalGameport/ggp_module.git
projects[ggp][download][tag] = 7.x-1.0-rc3
projects[ggp][type] = module
projects[ggp][version] = 7.x-1.0-rc3

; Themes
projects[adaptivetheme][version] = 2.3
projects[adaptivetheme][type] = theme

; Please fill the following out. Type may be one of get, cvs, git, bzr or svn,
; and url is the url of the download.
projects[ggp_theme][download][type] = git
projects[ggp_theme][download][url] = http://github.com/GlobalGameport/ggp_theme.git
projects[ggp_theme][download][tag] = 7.x-1.0-rc6
projects[ggp_theme][type] = theme
projects[ggp_theme][version] = 7.x-1.0-rc6

projects[libraries][version] = 2.0
projects[libraries][type] = module


; Libraries
; Please fill the following out. Type may be one of get, cvs, git, bzr or svn,
; and url is the url of the download.
libraries[ckeditorLib][download][type] = get
libraries[ckeditorLib][download][url] = http://download.cksource.com/CKEditor/CKEditor/CKEditor%204.0.1/ckeditor_4.0.1_standard.tar.gz
libraries[ckeditorLib][directory_name] = ckeditor
libraries[ckeditorLib][type] = library


libraries[pluploadLib][download][type] = get
libraries[pluploadLib][download][url] = http://plupload.com/downloads/plupload_1_5_5.zip
libraries[pluploadLib][directory_name] = plupload
libraries[pluploadLib][type] = library

libraries[fanyboxLib][download][type] = get
libraries[fanyboxLib][download][url] = https://github.com/fancyapps/fancyBox/zipball/v2.1.3
libraries[fanyboxLib][directory_name] = fancybox
libraries[fanyboxLib][type] = library
