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
  coupon_match = {}

  cart.each do |item, item_info|
    # is there a coupon for this item? If so, save info
    coupon_match = coupons.detect { |coupon| coupon[:item] == item }

    if !coupon_match.nil?
      coupon_item = coupon_match[:item]
      coupon_num = coupon_match[:num]
      coupon_cost = coupon_match[:cost]
    end

    if item == coupon_item
      if item_info[:count] > coupon_num
        new_cart[item] = {}
        new_cart[item][:price] = item_info[:price]
        new_cart[item][:clearance] = item_info[:clearance]
        new_cart[item][:count] = item_info[:count] % coupon_num
        new_cart[item + " W/COUPON"] = {}
        new_cart[item + " W/COUPON"][:price] = coupon_cost
        new_cart[item + " W/COUPON"][:clearance] = item_info[:clearance]
        new_cart[item + " W/COUPON"][:count] = item_info[:count] - new_cart[item][:count]
      elsif (item_info[:count] % coupon_num) == 0 #no regularly-priced items added
        new_cart[item + " W/COUPON"] = {}
        new_cart[item + " W/COUPON"][:price] = coupon_cost
        new_cart[item + " W/COUPON"][:clearance] = item_info[:clearance]
        new_cart[item + " W/COUPON"][:count] = item_info[:count] - new_cart[item][:count]
      else #coupon doesn't apply, add without coupon
        new_cart[item] = {}
        new_cart[item][:price] = item_info[:price]
        new_cart[item][:clearance] = item_info[:clearance]
        new_cart[item][:count] = item_info[:count]
      end
    else #add item without coupon
      new_cart[item] = {}
      new_cart[item][:price] = item_info[:price]
      new_cart[item][:clearance] = item_info[:clearance]
      new_cart[item][:count] = item_info[:count]
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
