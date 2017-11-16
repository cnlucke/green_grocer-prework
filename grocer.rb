def consolidate_cart(cart)
  new_cart = {}

  cart.each do |item, item_info|
    if new_cart.has_key?(item)
      new_cart[item][:count] += 1
    else
      new_cart[item] = item_info
      new_cart[item][:count] = 1
    end
  end

  new_cart
end

def apply_coupons(cart, coupons)
  # code here
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
