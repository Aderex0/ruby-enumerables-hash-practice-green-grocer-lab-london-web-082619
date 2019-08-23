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
  # code here	  result = cart
  coupons.each do |coupon|
    item_name = coupon[:item]   # "AVOCADO"
    if cart.keys.include?(item_name) && cart[item_name][:count] >= coupon[:num]
      if result[item_name+" W/COUPON"].nil?
        result[item_name+" W/COUPON"] = {
          :price => (coupon[:cost] / coupon[:num]),
          :clearance => cart[item_name][:clearance],
          :count => coupon[:num]
        }
        result[item_name][:count] -= coupon[:num]
      else
        result[item_name+" W/COUPON"][:count] += coupon[:num]
        result[item_name][:count] -= coupon[:num]
      end 
    end 
  end 
  result
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
