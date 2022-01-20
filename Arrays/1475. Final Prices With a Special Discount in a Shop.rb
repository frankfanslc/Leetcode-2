require 'pry'

# Two pointer solution
def final_prices(prices)
  return [] if prices.empty? || prices.nil?

  left = 0
  right = 1
  stop = prices.length - 1
  result = []

  while result.length <= stop
    if left == stop
      result << prices[left]
      return result
    end

    if prices[right] <= prices[left]
      result << prices[left] - prices[right]
      left += 1
      right = left + 1
    else
      if right == stop
        result << prices[left]
        left += 1
        right = left + 1
      else
        right += 1
      end
    end
  end
end

prices = [8,4,6,2,3]
p final_prices(prices) == [4,2,4,2,3]

prices = [1,2,3,4,5]
p final_prices(prices) == [1,2,3,4,5]

prices = [10,1,1,6]
p final_prices(prices) == [9,0,1,6]
