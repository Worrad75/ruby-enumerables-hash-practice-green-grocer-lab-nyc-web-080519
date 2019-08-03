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
    

# def apply_coupons(cart, coupons)
  
#   coupons.each do |coupon_hash|
#     coupon_hash.each do |att, val|
#       name = coupon_hash[:item]
      
#       if cart[name] && cart[name][:count] >= coupon_hash[:num]
#         if cart["#{name} W/COUPON"]
#           cart["#{name} W/COUPON"][:count] += 1
#         else
#           cart["#{name} W/COUPON"] = {:price=>coupon_hash[:cost],
#           :clearence=>cart[name][:clearance], :count=>1}
#         end
        
#         cart[name][:count] -= coupon_hash[:num]
#       end
#     end
#   end
#   cart
# end


apply_coupons(consolidate_cart(sample), coupon)


def apply_coupons(cart, coupon)
  coupon.each do |item|
    name_of_item = item[:item]
    if cart.has_key?(name_of_item) == true && cart[name_of_item][:count] >= item[:num]
      cart[name_of_item][:count] = cart[name_of_item][:count] - item[:num]
      new_item = name_of_item + (" W/COUPON")
      puts cart.has_key?(new_item)
      if cart.has_key?(new_item) == false
        cart[new_item] = {:price => item[:cost], :clearance => cart[name_of_item][:clearance], :count => 1}
      else 
        cart[new_item][:count] += 1
      end
    end
  end
  cart
end
apply_coupons(consolidate_cart(sample), coupon)







def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
