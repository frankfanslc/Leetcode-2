require 'pry'

# [2,3,5]
def coin_change(coins, amount)
  result = []

  amount.times do |x|
    result << x if x == 0

    coins.each do |coin|
      temp = []
      change_attempt = x % coin
      temp << change_attempt if change_attempt == 0
      result[x] << temp.min
    end
  end

  result[n]
end

p coin_change([1,2,5], 11) == 3
p coin_change([2], 3) == -1
p coin_change([1], 0) == 0
