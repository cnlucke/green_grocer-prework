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
  coupon_item = coupon[:item]
  coupon_num = coupon[:num]
  coupon_cost = coupon[:cost]

  cart.each do |item, item_info|
      if cart.has_key?(coupon_item)
        #apply coupon
      else #add item without coupon
        new_cart[item] = item_info
      end
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
