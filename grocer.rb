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
      
      if cart[name] && cart[name][:count] >= coupon_hash[:num]
        
        if cart["#{name} W/COUPON"]
          cart["#{name} W/COUPON"][:count] += coupon_hash[:num]
        else
          cart["#{name} W/COUPON"] = {:price=>(coupon_hash[:cost]/coupon_hash[:num]),
          :clearence=>cart[name][:clearance], :count=>1}
        end
        
        cart[name][:count] -= coupon_hash[:num]
      end
    end
  end
  cart
end


# def apply_coupons(cart, coupons)
#   coupons.each do |coupon_hash|
#     fruit_name = coupon_hash[:item]
#     new_coupon_hash = {
#       :price => coupon_hash[:cost],
#       :clearance => "true",
#       :count => coupon_hash[:num]
#     }
    
#     if cart.key?(fruit_name)
#       new_coupon_hash[:clearance] = cart[fruit_name][:clearance]
#       if cart[fruit_name][:count]>= new_coupon_hash[:count]
#         new_coupon_hash[:count] = (cart[fruit_name][:count]/new_coupon_hash[:count]).floor
#         cart[fruit_name][:count] = (coupon_hash[:num])%(cart[fruit_name][:count])
#       end
#       cart[fruit_name + " W/COUPON"] = new_coupon_hash 
#     end
#     end
#   return cart
# end




def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
