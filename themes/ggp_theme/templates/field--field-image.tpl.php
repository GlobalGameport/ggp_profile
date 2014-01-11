<?php $tag = $label_hidden ? 'div' : 'section'; ?>
<<?php print $tag; ?> class="<?php print $classes; ?> clearfix"<?php print $attributes; ?>>
  <?php if (!$label_hidden) : ?>
    <h2 class="field-label"<?php print $title_attributes; ?>><?php print $label ?>:&nbsp;</h2>
  <?php endif; ?>
  <table class="field-items"<?php print $content_attributes; ?>>   
    <?php foreach ($items as $delta => $item) : ?>
      <?php if ($delta % 4 == 0) print '<tr>'; ?>
      <td class="field-item"<?php print $item_attributes[$delta]; ?>>
        <?php print render($item); ?>
      </td>
      <?php if ($delta % 4 == 3) print '</tr>'; ?>
    <?php endforeach; ?>
    
    <?php if( ( $i = count($items) ) % 4 != 0 ) : ?>
      <?php while ( $i % 4 != 0 ) : ?>
        <td></td>
        <?php if ( $i % 4 == 3 ) print '</tr>'; ?>
        <?php $i++; ?>
      <?php endwhile; ?>
    <?php endif; ?>
  </table>
</<?php print $tag; ?>>
