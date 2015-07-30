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
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/fraud.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons">
        <a onclick="$('#form').submit();" class="button-save"><?php echo $button_save; ?></a>
        <a onclick="apply();" class="button-save"><?php echo $button_apply; ?></a>
        <a href="<?php echo $cancel; ?>" class="button-cancel"><?php echo $button_cancel; ?></a>
      </div>
    </div>
    <div class="content">
      <div class="tooltip" style="margin:5px 0px 10px 0px;"><?php echo $text_signup; ?></div>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" name="fraudlabspro">
        <table class="form">
          <tr>
            <td><span class="required">*</span> <?php echo $entry_key; ?></td>
            <td><input type="text" name="fraudlabspro_key" value="<?php echo $fraudlabspro_key; ?>" size="50" />
            <?php if ($error_key) { ?>
              <span class="error"><?php echo $error_key; ?></span>
            <?php } ?>
            </td>
          </tr>
          <tr>
            <td><?php echo $entry_score; ?></td>
            <td><input type="text" name="fraudlabspro_score" value="<?php echo $fraudlabspro_score; ?>" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_order_status; ?></td>
            <td><select name="fraudlabspro_order_status_id">
              <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $fraudlabspro_order_status_id) { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
              <?php } ?>
            </select></td>
          </tr>
          <tr style="background:#FCFCFC;">
            <td><?php echo $entry_status; ?></td>
            <td><?php if ($fraudlabspro_status) { ?>
              <?php echo $text_yes; ?><input type="radio" name="fraudlabspro_status" value="1" checked="checked" />
              <?php echo $text_no; ?><input type="radio" name="fraudlabspro_status" value="0" />
            <?php } else { ?>
              <?php echo $text_yes; ?><input type="radio" name="fraudlabspro_status" value="1" />
              <?php echo $text_no; ?><input type="radio" name="fraudlabspro_status" value="0" checked="checked" />
            <?php } ?></td>
          </tr>
        </table>
		<h2><?php echo $text_rules; ?></h2>
        <table class="form">
          <tr>
            <td><?php echo $entry_review_status; ?></td>
            <td><select name="fraudlabspro_review_status_id">
              <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $fraudlabspro_review_status_id) { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_approve_status; ?></td>
            <td><select name="fraudlabspro_approve_status_id">
              <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $fraudlabspro_approve_status_id) { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_reject_status; ?></td>
            <td><select name="fraudlabspro_reject_status_id">
              <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $fraudlabspro_reject_status_id) { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
              <?php } ?>
            </select></td>
          </tr>
        </table>
		<h2><?php echo $text_testing; ?></h2>
        <table class="form">
          <tr>
            <td><?php echo $entry_simulate_ip; ?></td>
            <td><input type="text" name="fraudlabspro_simulate_ip" value="<?php echo $fraudlabspro_simulate_ip; ?>" /></td>
          </tr>
		</table>
      </form>
    </div>
  </div>
</div>
<?php echo $footer; ?>