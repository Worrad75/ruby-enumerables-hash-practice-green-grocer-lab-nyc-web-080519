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



def apply_coupons(cart:[], coupons:[])
    apply_coupons_hash = {}
      coupon_items = [] # get coupon item names
        coupons.each do |item|
          coupon_items << item[:item]
        end
    cart.each do |item|
      name = item[0]
      attributes = item[1]
      num_of_coupon = 0
      coupon_price = 0
      coupons.each do |coupon_hash| #get num and cost of that particular item from coupons hash
        if coupon_hash[:item] == name
          num_of_coupon = coupon_hash[:num]
          coupon_price = coupon_hash[:cost]
        end
      end
      num_of_coupon #quantity of item required for coupon to work

      if ((coupon_items.include?(name)) && (attributes[:count] >= num_of_coupon))
      #for the current item, if the count is >= coupon quantity requirement
      #decrease the item count and add the coupon hash 
      quantity = (attributes[:count] / num_of_coupon) #item quantity/coupon quantity
        apply_coupons_hash[name] = {:price => attributes[:price], :clearance => attributes[:clearance], :count =>(attributes[:count] - (num_of_coupon * quantity))}
        apply_coupons_hash[name + ' W/COUPON'] = {:price => coupon_price, :clearance => attributes[:clearance], :count => quantity}
      else #if no coupon for this item, then just add the existing item hash to apply_coupons_hash
        apply_coupons_hash[name] = {:price => attributes[:price], :clearance => attributes[:clearance], :count => attributes[:count]}
      end
    end
    apply_coupons_hash
 end





def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
