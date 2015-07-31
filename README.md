[GGP_NET](http://globalgameport.com) [![Build Status](https://travis-ci.org/GlobalGameport/ggp_profile.svg?branch=7.x-2.x)](https://travis-ci.org/GlobalGameport/ggp_profile)
==

Instructions on how to build a GlobalGameport Fansite from Drupal 7.

Requirements
------------

* [drush](http://drupal.org/project/drush) 
* [drush_make](http://drupal.org/project/drush_make)

Installation
------------

To build a complete site, run:

    drush make ggp_net.build --prepare-install ~/workspace/ggp_net_build

Then check permissions
    
    cd ~/workspace/ggp_net_build
    chmod 777 sites/default/settings.php
    chmod 777 sites/default/files

Navigate to the root directory in a webbrowser.

#### Update existing install profile ####

If you want to update just the install profile instead of rebuilding the
entire site, you can run this:

    drush make --no-core --contrib-destination=. ggp_net.make

#### Rebuild everything ####

If you want to force a rebuild of everything, you can run this:

    drush si ggp_net
