def consolidate_cart(cart)    #this cart is an array of hashes
  consolidated = { }
  cart.each do |(key, value)|
    if consolidated.has_key(key)
      consolidated[value][count] += 1
    else
      consolidated[key] = value
      consolidated[value][count] = 1
    end
  end
  consolidated
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
