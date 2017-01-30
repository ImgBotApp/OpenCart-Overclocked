<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
  </div>
  <?php if ($success) { ?>
    <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <?php if ($error) { ?>
    <div class="warning"><?php echo $error; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/payment.png" alt="" /> <?php echo $heading_title; ?> (<?php echo $total_extensions; ?>)</h1>
      <div class="buttons">
        <a href="<?php echo $payment_images; ?>" class="button<?php echo $payment_button; ?>"><?php echo $button_images; ?></a>
        <a id="installed" class="button"><?php echo $button_filter; ?></a>
        <a onclick="location = '<?php echo $close; ?>';" class="button-cancel"><?php echo $button_close; ?></a>
      </div>
    </div>
    <div class="content-body">
      <table class="list">
        <thead>
          <tr>
            <td class="left"><?php echo $column_name; ?></td>
            <td></td>
            <td class="left"><?php echo $column_sort_order; ?></td>
            <td class="left"><?php echo $column_status; ?></td>
            <td class="right"><?php echo $column_action; ?></td>
          </tr>
        </thead>
        <tbody>
        <?php if ($extensions) { ?>
          <?php foreach ($extensions as $extension) { ?>
          <tr<?php echo ($extension['set']) ? '' : ' class="not-set"'; ?>>
            <td class="left"><?php echo $extension['name']; ?></td>
            <td class="center"><?php echo $extension['link']; ?></td>
            <td class="center"><?php echo $extension['sort_order']; ?></td>
            <?php if ($extension['status'] == 1) { ?>
              <td class="center"><span class="enabled"><?php echo $text_enabled; ?></span></td>
            <?php } else { ?>
              <td class="center"><span class="disabled"><?php echo $text_disabled; ?></span></td>
            <?php } ?>
            <td class="right"><?php foreach ($extension['action'] as $action) { ?>
              <a href="<?php echo $action['href']; ?>" class="button-form-<?php echo $action['type']; ?>"><?php echo $action['text']; ?></a>
            <?php } ?></td>
          </tr>
          <?php } ?>
        <?php } else { ?>
          <tr>
            <td class="center" colspan="5"><?php echo $text_no_results; ?></td>
          </tr>
        <?php } ?>
        </tbody>
      </table>
    </div>
  </div>
</div>

<script type="text/javascript"><!--
$(document).ready(function() {
	$("#installed").click(function() {
		$(".not-set").toggle();
	});
});
//--></script>

<?php echo $footer; ?>