def consolidate_cart(cart)    #this cart is an array of hashes
  compact_cart = {}
  
  cart.each do |element|
    element.each do |item, hash|
      compact_cart[item] ||= hash
      compact_cart[item][:count] ||= 0
      compact_cart[item][:count] += 1
    end
  end
  compact_cart
end
    

def apply_coupons(cart, coupons)
  
  coupons.each do |coupon_hash|
    coupon_hash.each do |att, val|
      name = coupon_hash[:item]
      
      if cart[name] && cart[name][:count] >= cart
    end
  end
  
end








def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
