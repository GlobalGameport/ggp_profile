<?php
// $Id:$
?>
<div id="node-<?php print $node->nid; ?>" class="node<?php if ($sticky) { print ' sticky'; } ?><?php if (!$status) { print ' node-unpublished'; } ?>">

<?php print $picture ?>

<?php if ($page == 0): ?>
  <div class="node-title"><span><a href="<?php print $node_url ?>" title="<?php print $title ?>"><?php print $title ?></a></span></div>
<?php endif; ?>
<div class="node-content">

  <?php if ($submitted): ?>
    <span class="submitted"><?php print $submitted; ?></span>
  <?php endif; ?>


  <div class="content clear-block">
    <?php print $content ?>
  </div>
</div>
<div class="node-footer">
  <div class="clear-block">
    <div class="meta">
    <?php if ($taxonomy): ?>
      <div class="terms"><?php print $terms ?></div>
    <?php endif;?>
    </div>

    <?php if ($links): ?>
      <div class="links"><?php print $links; ?></div>
    <?php endif; ?>
  </div>
</div>
</div>
