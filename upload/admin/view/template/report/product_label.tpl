<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
  </div>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/report.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons">
        <a onclick="location = '<?php echo $close; ?>';" class="button-cancel"><?php echo $button_close; ?></a>
      </div>
    </div>
    <div class="content-body">
    <?php if ($navigation_hi) { ?>
      <div class="pagination" style="margin-bottom:10px;"><?php echo $pagination; ?></div>
    <?php } ?>
      <table class="list">
        <thead>
          <tr>
            <td class="left"><?php echo $column_product_id; ?></td>
            <td class="left"><?php echo $column_image; ?></td>
            <td class="left"><?php if ($sort == 'pd.name') { ?>
              <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
            <?php } else { ?>
              <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?>&nbsp;&nbsp;<img src="view/image/sort.png" alt="" /></a>
            <?php } ?></td>
            <td class="left"><?php if ($sort == 'p.price') { ?>
              <a href="<?php echo $sort_price; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_price; ?></a>
            <?php } else { ?>
              <a href="<?php echo $sort_price; ?>"><?php echo $column_price; ?>&nbsp;&nbsp;<img src="view/image/sort.png" alt="" /></a>
            <?php } ?></td>
            <td class="left"><?php if ($sort == 'p.cost') { ?>
              <a href="<?php echo $sort_cost; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_cost; ?></a>
            <?php } else { ?>
              <a href="<?php echo $sort_cost; ?>"><?php echo $column_cost; ?>&nbsp;&nbsp;<img src="view/image/sort.png" alt="" /></a>
            <?php } ?></td>
            <td class="left"><?php echo $column_label; ?></td>
          </tr>
        </thead>
        <tbody>
          <tr class="filter">
            <td></td>
            <td></td>
            <td><input type="text" name="filter_name" value="<?php echo $filter_name; ?>" /></td>
            <td></td>
            <td></td>
            <td class="right"><a onclick="filter();" class="button-filter"><?php echo $button_filter; ?></a></td>
          </tr>
          <?php if ($products) { ?>
            <?php foreach ($products as $product) { ?>
              <tr>
                <td class="center"><?php echo $product['product_id']; ?></td>
                <td class="center"><img src="<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>" style="padding:1px; border:1px solid #DDD;" /></td>
                <td class="left"><a href="<?php echo $product['product_href']; ?>" title=""><?php echo $product['name']; ?></a></td>
                <td class="right"><?php if ($product['special']) { ?>
                  <span style="text-decoration:line-through;"><?php echo $product['price']; ?></span><br />
                  <span style="color:#FF0000;"><?php echo $product['special']; ?></span><br />
                <?php } else { ?>
                  <?php echo $product['price']; ?>
                <?php } ?></td>
                <td class="right"><?php echo $product['cost']; ?></td>
                <td class="center"><img src="<?php echo $product['label']; ?>" alt="<?php echo $product['name']; ?>" style="padding:1px;" /></td>
              </tr>
            <?php } ?>
          <?php } else { ?>
            <tr>
              <td class="center" colspan="6"><?php echo $text_no_results; ?></td>
            </tr>
          <?php } ?>
        </tbody>
      </table>
    <?php if ($navigation_lo) { ?>
      <div class="pagination"><?php echo $pagination; ?></div>
    <?php } ?>
    </div>
  </div>
</div>

<script type="text/javascript"><!--
function filter() {
	url = 'index.php?route=report/product_label&token=<?php echo $token; ?>';

	var filter_name = $('input[name=\'filter_name\']').attr('value');

	if (filter_name) {
		url += '&filter_name=' + encodeURIComponent(filter_name);
	}

	location = url;
}
//--></script>

<script type="text/javascript"><!--
$('#form input').keydown(function(e) {
	if (e.keyCode == 13) { filter(); }
});
//--></script>

<script type="text/javascript"><!--
$('input[name=\'filter_name\']').autocomplete({
	delay: 10,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=report/product_label/autocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.product_id
					}
				}));
			}
		});
	},
	select: function(event, ui) {
		$('input[name=\'filter_name\']').val(ui.item.label);
		return false;
	},
	focus: function(event, ui) {
		return false;
	}
});
//--></script>

<?php echo $footer; ?>