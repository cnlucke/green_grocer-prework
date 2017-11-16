def consolidate_cart(cart)
  new_cart = {}

  cart.uniq.each do |item|
    new_cart.merge!(item)
    new_cart[item.keys[0]][:count] = cart.count(item)
  end

  new_cart
end

def apply_coupons(cart, coupons)
  new_cart = {}
  coupon_item = coupons[:item]
  coupon_num = coupons[:num]
  coupon_cost = coupons[:cost]

  cart.each do |item, item_info|
    if item == coupon_item
      if item_info[:count] >= coupon_num
        new_cart[item] = {}
        new_cart[item + " W/COUPON"] = {}
        puts "APPLY COUPON!"
      else #coupon doesn't apply, add without coupon
        new_cart[item] = item_info
      end
    else #add item without coupon
      new_cart[item] = item_info
    end
  end

  new_cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
