def consolidate_cart(cart)    #this cart is an array of hashes
  organized_cart = {}
  
  cart.each do |element|
    count = 0
    element.each do |item, hash|
      organized_cart[item] ||= hash
      organized_cart[item][:count] ||= 0
      organized_cart[item][:count] += 1
    end
  end
  return organized_cart
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
