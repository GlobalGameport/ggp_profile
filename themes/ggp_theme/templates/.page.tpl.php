<?php
// $Id:$
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php print $language->language ?>" lang="<?php print $language->language ?>">
<head>
<?php print $head ?>
<title><?php print $head_title ?></title>


<style>
* {
	padding:0;
	margin:0;
}
body {
	background:black;
}
</style>
<?php print $styles ?>
<?php print $scripts ?>
</head>
<body class="<?php print $body_classes; ?>">
<div id="container" class="container">
  <div id="network" name="top" class="grid_full">

    <div id="netzwerkleiste" class="grid_network alpha">
		<!-- NETWORKBUTTON -->
		<?php if ($network): ?>
		<?php print $network ?>
		<?php endif; ?>
    </div>
    <div id="topleader" class="grid_leader">
		<!-- LEADERBOARD AD -->
                <?php if ($leaderboard): ?>
		<?php print $leaderboard ?>
		<?php endif; ?>
    </div>
    <div id="XD-login" class="grid_login omega">
		<!-- LOGIN CONTENT -->
		<?php if ($login): ?>
		<?php print $login ?>
		<?php endif; ?>
    </div>

  </div><!-- end #top -->
  <div id="header" class="grid_full">
		<!-- HEADER -->
		
		<?php if ($logo): ?>
		  <img src="<?php print $logo ?>" titel="<?php print $head_title ?>"/>
		<?php endif; ?>
  </div><!-- end #header -->
  <div class="clear"></div>
  <div id="top" class="grid_full">
    <div class="grid_left2content alpha"> 
    	<div id="top-links">
		<!-- TOP-LINKS CONTENT -->
		<?php if ($top): ?>
		<?php print $top ?>
		<?php endif; ?>
		
	</div><!-- end #top-links -->
	<div id="top-search">
		<!-- TOP-SEARCH CONTENT -->
		<?php print $search_box ?> 
	</div><!-- end #top-search -->

    </div><!-- end .grid_left2conten -->
    <div id="partner-title" class="grid_right omega">
		<!-- PARTNER CONTENT -->
		<div>
		<a href="http://twitter.com/globalgameport"><img src="/<?php print $directory ?>/twitter.png" alt="GGP bei Twitter" /></a>
		<a href="http://www.youtube.com/user/globalgameport"><img src="/<?php print $directory ?>/youtube.png" alt="GGP bei Yout Tube" /></a>
		</div>
    </div><!-- end #partner-title -->
  </div><!-- end #top -->
  
  <div class="clear"></div>
  <div id ="main" class="grid_full">

    <div id="sidebar-left" class="grid_left alpha">
      <div class="sidebar-left-content">
        	<!-- LEFT CONTENT --> 
		<?php if ($left): ?>
		<?php print $left ?>
		<?php endif; ?> 


    
      </div><!-- end #sidebar-left-content -->
    </div><!-- end #sidebar-left -->
    <div id="content" class="grid_content">
		<!-- CONTENT -->
		
		<?php if ($title) { ?>  <h2 class="title"><?php print $title ?></h2> <?php } ?>
		
		<?php print $help ?>
		<?php if ($show_messages) { print $messages; } ?>

		<?php print $content ?>
<div class="tabs"><?php print $tabs ?></div>

    </div><!-- end #mainContent -->
    <div id="sidebar-right" class="grid_right omega">
    	<div class="sidebar-right-content">
		<!-- RIGHT CONTENT -->

		<div id="pcgames">
			<img src="/<?php print $directory ?>/images/pcgames.png" title="PCGAMES" alt="PCGAMES" />
		</div>
		<?php if ($right): ?>
		<?php print $right ?>
		<?php endif; ?>


 
      </div><!-- end #sidebar2-right-content -->
    </div><!-- end #sidebar2 -->
  </div>

  <div class="clear"></div>
  <div id="footer" class="grid_full">
  		<!-- FOOTER CONTENT -->
  		<?php print $footer_message ?>
  </div><!-- end #footer -->
  
</div><!-- end #container -->
<?php print $closure ?>
</body>
</html>