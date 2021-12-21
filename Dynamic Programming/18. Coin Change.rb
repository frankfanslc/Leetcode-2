require 'pry'

def coin_change(coins, amount)
  # Assumes there will always be a 1
  if amount == 0
    return 0
  end

  coins = coins.sort!.reverse
  remainder = amount
  result = []

  coins.each do |coin|
    coin_amount = remainder / coin
    remainder = remainder - (coin_amount * coin)

    if coin_amount > 0
      result << coin_amount
    end
  end

  if result.empty?
    return -1
  end

  if remainder > 0
    return -1
  end

  result.sum
end

p coin_change([1,2,5], 11) == 3
p coin_change([2], 3) == -1
p coin_change([1], 0) == 0
