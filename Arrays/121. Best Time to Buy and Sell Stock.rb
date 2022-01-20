require 'pry'

def max_profit(prices)
  min_price = prices.max
  max = 0

  prices.each_with_index do |price, idx|
    if price < min_price
      min_price = price
    elsif (price - min_price > max)
      max = price - min_price
    end
  end

  max
end

# Kadane's Algo
def max_profit(prices)
  min_buy = prices.first
  best_profit = 0

  prices.each do |price|
    min_buy = [min_buy, price].min
    potential_profit = (price - min_buy)
    best_profit = [best_profit, potential_profit].max
  end

  best_profit
end
