require 'pry'

def max_profit(prices)
  profits = [0]

  right_index = prices.length - 1

  prices.compact.each_with_index do |left_price, left_index|
    break if left_index == right_index

    sell_index = left_index + 1

    while sell_index <= right_index
      if prices[sell_index] > left_price
        profit = (prices[sell_index] - left_price)
        profits = insert_higher_profit(profits, profit)
      end

      sell_index += 1
    end
  end

  profits[0]
end

def insert_higher_profit(profits, profit)
  if profits[0] < profit
    profits = [profit]
  end

  profits
end

p (max_profit([7,1,5,3,6,4]) == 5)
p (max_profit([7,6,4,3,1]) == 0)
p (max_profit([1,2]) == 1)
