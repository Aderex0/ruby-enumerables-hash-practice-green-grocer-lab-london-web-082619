def consolidate_cart(cart)
  new_hash = {}
  cart.each do |item|
    item.each do |key, value|
      if new_hash[key]
        new_hash[key][:count] += 1
      else
        new_hash[key] = value
        new_hash[key][:count] = 1
      end
    end
  end
  new_hash
end

def apply_coupons(cart, coupons)
  applied_cart = cart
  coupons.each do |coupon|
    coupon_item = coupon[:item]
    if cart[coupon_item][:count] >= 2 && cart.keys.include?(coupon_item)
      if applied_cart[coupon_item+" W/COUPON"] == nil
        applied_cart[coupon_item + " W/COUPON"] = {
          :price => coupon[:cost] / coupon[:num], #2.50
          :clearance => cart[coupon_item][:clearance],
          :count => coupon[:num]
        }
        applied_cart[coupon_item][:count] -= coupon[:num]
      else
        applied_cart[coupon_item+" W/COUPON"][:count] += coupon[:num]
        applied_cart[coupon_item][:count] -= coupon[:num]
      end
    end
  end
  applied_cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
