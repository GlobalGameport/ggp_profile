<?php print $outer_prefix . $inner_prefix; ?>

    <?php print render($title_prefix); ?>
    <?php if ($title): ?>
      <h4<?php print $title_attributes; ?>><?php print $title; ?></h4>
    <?php endif; ?>
    <?php print render($title_suffix); ?>
    <?php print $content_processed; ?>
<?php print $inner_suffix . $outer_suffix; ?>
