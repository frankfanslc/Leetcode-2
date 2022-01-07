require 'pry'

def add_strings(num1, num2)
  iterations = [num1.length, num2.length].max
  ones_digit = -1
  carry_over = ""
  result = ""

  iterations.times do |x|
    digits = [num1[ones_digit - x], num2[ones_digit - x], carry_over].compact
    sum = digits.inject(0) do |memo, digit|
      memo += digit.to_i
      memo
    end.to_s

    if sum.length > 1
      result.prepend(sum[-1])
      carry_over = sum[0..-2]
    else
      result.prepend(sum[-1])
      carry_over = ""
    end
  end

  carry_over + result
end

p add_strings("11", "123") == "134"
p add_strings("0", "0") == "0"
p add_strings("456", "77") == "533"
