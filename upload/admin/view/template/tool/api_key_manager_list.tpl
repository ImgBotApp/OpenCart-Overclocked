<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
    <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <?php if ($success) { ?>
    <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/api.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons">
        <a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a>
        <a onclick="$('form').submit();" class="button-delete"><?php echo $button_delete; ?></a>
      </div>
    </div>
    <div class="content-body">
    <?php if ($navigation_hi) { ?>
      <div class="pagination" style="margin-bottom:10px;"><?php echo $pagination; ?></div>
    <?php } ?>
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="list">
        <thead>
          <tr>
            <td width="1" style="text-align:center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" id="check-all" class="checkbox" />
            <label for="check-all"><span></span></label></td>
            <td class="left"><?php if ($sort == 'name') { ?>
              <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
            <?php } else { ?>
              <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?>&nbsp;&nbsp;<img src="view/image/sort.png" alt="" /></a>
            <?php } ?></td>
            <td class="left"><?php if ($sort == 'code') { ?>
              <a href="<?php echo $sort_code; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_code; ?></a>
            <?php } else { ?>
              <a href="<?php echo $sort_code; ?>"><?php echo $column_code; ?>&nbsp;&nbsp;<img src="view/image/sort.png" alt="" /></a>
            <?php } ?></td>
            <td class="left"><?php echo $column_status; ?></td>
            <td class="right"><?php echo $column_action; ?></td>
          </tr>
        </thead>
        <tbody>
          <?php if ($api_keys) { ?>
            <?php foreach ($api_keys as $api_key) { ?>
              <tr>
                <td style="text-align:center;"><?php if ($api_key['selected']) { ?>
                  <input type="checkbox" name="selected[]" value="<?php echo $api_key['api_key_id']; ?>" id="<?php echo $api_key['api_key_id']; ?>" class="checkbox" checked />
                  <label for="<?php echo $api_key['api_key_id']; ?>"><span></span></label>
                <?php } else { ?>
                  <input type="checkbox" name="selected[]" value="<?php echo $api_key['api_key_id']; ?>" id="<?php echo $api_key['api_key_id']; ?>" class="checkbox" />
                  <label for="<?php echo $api_key['api_key_id']; ?>"><span></span></label>
                <?php } ?></td>
                <td class="left"><?php echo $api_key['name']; ?></td>
                <td class="left"><?php echo $api_key['code']; ?></td>
                <?php if ($api_key['status'] == 1) { ?>
                  <td class="center"><span class="enabled"><?php echo $text_enabled; ?></span></td>
                <?php } else { ?>
                  <td class="center"><span class="disabled"><?php echo $text_disabled; ?></span></td>
                <?php } ?>
                <td class="right"><?php foreach ($api_key['action'] as $action) { ?>
                  <a href="<?php echo $action['href']; ?>" class="button-form"><?php echo $action['text']; ?></a>
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
      </form>
    <?php if ($navigation_lo) { ?>
      <div class="pagination"><?php echo $pagination; ?></div>
    <?php } ?>
    </div>
  </div>
</div>
<?php echo $footer; ?> 