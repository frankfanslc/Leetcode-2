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
