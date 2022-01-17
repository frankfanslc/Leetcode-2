require 'pry'

def plus_one(digits)
  (digits.join.to_i + 1).digits.reverse
end

def plus_one(digits)
  remainder = 1
  length = digits.length - 1
  increment = 0

  while remainder > 0
    idx = length - increment

    if idx == 0 && remainder > 0
      digits[idx] = 0
      return digits.prepend(remainder)
    end

    if (digits[idx] + remainder) > 9
      digits[idx] = 0
      remainder = (digits[idx] + remainder) - 9
      increment += 1
    else
      digits[idx] = digits[idx] + remainder
      return digits
    end
  end

  digits
end

p plus_one([9])
