<div id="incredible_bg">
<div id="lines_top">


<div id="page" class="container">
  <?php print render($page['leaderboard']); ?>

  <header class="clearfix" role="banner">

    <?php if ($linked_site_logo): ?>
      <div id="logo"><?php print $linked_site_logo; ?></div>
    <?php endif; ?>

    <?php print render($page['header']); ?>

  </header>

  <?php //print render($page['menu_bar']); ?>
  <?php //if ($primary_navigation): print $primary_navigation; endif; ?>
  <?php //if ($secondary_navigation): print $secondary_navigation; endif; ?>


  <?php print $messages; ?>
  <?php print render($page['help']); ?>

  <?php print render($page['secondary_content']); ?>

  <div id="columns"><div class="columns-inner clearfix">
    <div id="content-column"><div class="content-inner">

      <?php if ($breadcrumb): ?>
        <nav id="breadcrumb"><?php print $breadcrumb; ?></nav>
      <?php endif; ?>

      <?php print render($page['highlighted']); ?>

      <?php $tag = $title ? 'section' : 'div'; ?>
      <<?php print $tag; ?> id="main-content" role="main">

        <?php print render($title_prefix); ?>
        <?php if ($title || $primary_local_tasks || $secondary_local_tasks || $action_links = render($action_links)): ?>
          <header>
            <?php if (!$is_front && $title): ?>
              <h1 id="page-title"><?php print $title; ?></h1>
            <?php endif; ?>

            <?php if ($primary_local_tasks || $secondary_local_tasks || $action_links): ?>
              <div id="tasks">
                <?php if ($primary_local_tasks): ?>
                  <ul class="tabs primary clearfix"><?php print render($primary_local_tasks); ?></ul>
                <?php endif; ?>
                <?php if ($secondary_local_tasks): ?>
                  <ul class="tabs secondary clearfix"><?php print render($secondary_local_tasks); ?></ul>
                <?php endif; ?>
                <?php if ($action_links = render($action_links)): ?>
                  <ul class="action-links clearfix"><?php print $action_links; ?></ul>
                <?php endif; ?>
              </div>
            <?php endif; ?>
          </header>
        <?php endif; ?>
        <?php print render($title_suffix); ?>

        <div id="content"><?php print render($page['content']); ?></div>

        <!--<?php print $feed_icons; ?>-->

      </<?php print $tag; ?>>

      <?php print render($page['content_aside']); ?>

    </div></div>

    <?php print render($page['sidebar_first']); ?>
    <?php print render($page['sidebar_second']); ?>

  </div></div>

  <?php print render($page['tertiary_content']); ?>

  <?php if ($page['three_25_25_50_first'] || $page['three_25_25_50_second'] || $page['three_25_25_50_third']): ?>
    <div class="three-25-25-50 gpanel clearfix">
      <?php print render($page['three_25_25_50_first']); ?>
      <?php print render($page['three_25_25_50_second']); ?>
      <?php print render($page['three_25_25_50_third']); ?>
    </div>
  <?php endif; ?>


    <footer role="contentinfo">
    <?php if ($page['footer']): ?><?php print render($page['footer']); ?><?php endif; ?>
      <div class="copyright">
        &copy; 2006 - <?php echo date("Y"); ?> GlobalGameport.com - Alle Rechte vorbehalten  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Kopieren oder direktes Verlinken von Inhalten dieser Seite ohne schriftliche Erlaubnis des verantwortlichen Webmasters/Autors ist untersagt.<br /><a href="<?php echo base_path(); ?>impressum">Impressum</a> &nbsp;|&nbsp; <a href="<?php echo base_path(); ?>disclaimer">Disclaimer</a> &nbsp;|&nbsp; <a href="<?php echo base_path(); ?>sitemap.xml">Sitemap</a> &nbsp;|&nbsp; <a href="<?php echo base_path(); ?>user/login">Login</a><br /><a href="<?php echo base_path(); ?>ueber-global-gameport">&Uuml;ber Global Gameport</a> &nbsp;|&nbsp; <a target="_blank" href="http://jobs.globalgameport.com">Jobs</a> &nbsp;|&nbsp; <a target"_blank" href="http://www.globalgameport.com">Forum</a> &nbsp;|&nbsp; <a target"_blank" href="http://www.globalgameport.com/register.php">Bei GGP registrieren</a> &nbsp;|&nbsp; <a target"_blank" href="http://www.facebook.com/globalgameport">GGP @ Facebook</a> &nbsp;|&nbsp; <a target"_blank" href="http://twitter.com/globalgameport">GGP @ Twitter</a> &nbsp;|&nbsp; <a target"_blank" href="http://www.youtube.com/user/globalgameport">GGP @ You Tube</a>
      <br />GGP Future Theme 1.0 &copy; by <a target="_blank" href="https://www.facebook.com/vanditthebandit">vandit</a><br />Powered by <a target="_blank" href="http://drupal.org">Drupal</a><br /><br />
	  </div>
    </footer>


</div>

</div>
</div>
