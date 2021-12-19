require 'pry'

# def max_profit(prices)
#   # 1. Iterate through array
#   # 2. Find max in remaining > current
#   # 3. Get difference max - current
#   # 4. if difference > curr_diff
#   # 5. return difference

#   difference = 0
#   length = prices.length - 1

#   prices.each_with_index do |price, idx|
#     larger = prices[idx+1..length].select do |other_price|
#       other_price > price
#     end

#     max = larger.max

#     if max
#       curr_difference = max - price

#       if curr_difference > difference
#         difference = curr_difference
#       end
#     end
#   end

#   difference
# end

def max_profit(prices)
  min_price = prices.max
  max_diff = 0

  prices.each_with_index do |price, idx|
    if price < min_price
      min_price = price
    elsif (price - min_price > max_diff)
      max_diff = price - min_price
    end
  end

  max_diff
end

p max_profit([7,1,5,3,6,4]) == 5
p max_profit([7,6,4,3,1]) == 0
