require 'pry'

def max_profit(prices)
  return 0 if prices.nil? || prices.empty?

  left = 0
  right = 1
  stop = prices.length - 1
  max = 0

  while !prices[right].nil?
    max = [max, prices[right] - prices[left]].max

    if right == stop
      left += 1
      right = left + 1
    else
      right += 1
    end
  end

  max
end


def max_profit(prices)
  return 0 if prices.nil? || prices.empty?

  left = 0
  right = prices.length - 1
  max = 0

  while left < right
    max = [max, prices[right] - prices[left]].max

    if prices[left+1] < prices[left]
      left += 1
    end

    if prices[right-1] > prices[right]
      right -= 1
    end
  end

  max
end


prices = [2,7,1,11,4]
p max_profit(prices) == 10

prices = [7,1,5,3,6,4]
p max_profit(prices) == 5

prices = [7,6,4,3,1]
p max_profit(prices) == 0
