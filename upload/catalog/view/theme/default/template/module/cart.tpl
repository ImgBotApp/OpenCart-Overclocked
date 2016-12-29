<div id="cart">
  <div class="heading">
    <a title=""><span id="cart-total"><?php echo $text_items; ?></span></a>
  </div>
  <div class="content">
  <?php if ($products || $vouchers) { ?>
    <div class="mini-cart-info">
    <table>
      <?php foreach ($products as $product) { ?>
      <tr>
        <td class="image">
          <?php if ($product['thumb']) { ?>
            <?php if ($product['stock_label']) { ?>
              <div class="stock-small"><img src="<?php echo $product['stock_label']; ?>" alt="" /></div>
            <?php } ?>
            <?php if (!$product['stock_label'] && $product['offer']) { ?>
              <div class="offer-small"><img src="<?php echo $product['offer_label']; ?>" alt="" /></div>
            <?php } ?>
            <?php if (!$product['stock_label'] && !$product['offer'] && $product['special']) { ?>
              <div class="special-small"><img src="<?php echo $product['special_label']; ?>" alt="" /></div>
            <?php } ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
          <?php } ?>
        </td>
        <td class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
        <div>
          <?php foreach ($product['option'] as $option) { ?>
            - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small><br />
          <?php } ?>
          <?php if ($product['recurring']) { ?>
            - <small><?php echo $text_payment_profile; ?> <?php echo $product['profile']; ?></small><br />
          <?php } ?>
        </div>
        </td>
        <td class="quantity">x&nbsp;<?php echo $product['quantity']; ?></td>
        <td class="total"><?php echo $product['total']; ?></td>
        <td class="remove">
          <img src="catalog/view/theme/<?php echo $template; ?>/image/remove-small.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" onclick="(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&remove=<?php echo $product['key']; ?>' : $('#cart').load('index.php?route=module/cart&remove=<?php echo $product['key']; ?>' + ' #cart > *');" />
        </td>
      </tr>
      <?php } ?>
      <?php foreach ($vouchers as $voucher) { ?>
      <tr>
        <td class="image"></td>
        <td class="name"><?php echo $voucher['description']; ?></td>
        <td class="quantity">x&nbsp;1</td>
        <td class="total"><?php echo $voucher['amount']; ?></td>
        <td class="remove">
          <img src="catalog/view/theme/<?php echo $template; ?>/image/remove-small.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" onclick="(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&remove=<?php echo $voucher['key']; ?>' : $('#cart').load('index.php?route=module/cart&remove=<?php echo $voucher['key']; ?>' + ' #cart > *');" />
        </td>
      </tr>
      <?php } ?>
    </table>
    </div>
    <div class="mini-cart-total">
    <table>
      <?php foreach ($totals as $total) { ?>
      <tr>
        <td class="right"><b><?php echo $total['title']; ?>:</b></td>
        <td class="right"><?php echo $total['text']; ?></td>
      </tr>
      <?php } ?>
    </table>
    </div>
    <div class="checkout">
      <a href="<?php echo $cart; ?>" class="button"><?php echo $text_cart; ?></a>
      <a href="<?php echo $checkout; ?>" class="button"><?php echo $text_checkout; ?></a>
    </div>
  <?php } else { ?>
    <div class="empty"><?php echo $text_empty; ?></div>
  <?php } ?>
  </div>
</div>