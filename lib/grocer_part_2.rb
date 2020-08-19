require_relative './part_1_solution.rb'
require 'pry'
def apply_coupons(cart, coupons)
ccart = consolidate_cart(cart)
i=0
if coupons===[]
  ccart[0][:count]+=1
  return ccart
end
ccart.each do |key|
  coupons.each do |ckey|
    coupitem={}
    if ckey[:item]===key[:item]
      if key[:count]>ckey[:num]
        key[:count]-=ckey[:num]
        coupitem.merge! :item => "#{key[:item]} W/COUPON",:price => ckey[:cost].to_f/ckey[:num],:clearance => key[:clearance],:count => ckey[:num]
        ccart.push coupitem
      else if key[:count]<=ckey[:num]
        coupitem.merge! :item => "#{key[:item]} W/COUPON",:price => ckey[:cost].to_f/ckey[:num],:clearance => key[:clearance],:count => ckey[:num]
        ccart.push coupitem
        key[:count]-=ckey[:num]
        if (key[:count]-ckey[:num])<0
          key[:count]=0
        end
      end
end
end
end
end
return ccart
end


def apply_clearance(cart)
ccart = consolidate_cart(cart)
ccart.each do |key|
  if key[:clearance]
    key[:price]=key[:price]-(key[:price]/(1.2))
    binding.pry
  end
end
end


def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
