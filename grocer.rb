def consolidate_cart(cart)
  new_cart = []

  cart.uniq.each do |item|
    new_cart << item
    new_cart[new_cart.index(item)][item.keys[0]][:count] = cart.count(item)
  end

  new_cart.uniq
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
