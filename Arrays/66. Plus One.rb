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

    if idx == 0
      if (digits[idx] + remainder) > 9
        digits[idx] = 0
        return digits.prepend(remainder)
      else
        digits[idx] = digits[idx] + remainder
        return digits
      end
    end

    if (digits[idx] + remainder) > 9
      remainder = (digits[idx] + remainder) - 9
      digits[idx] = 0
      increment += 1
    else
      digits[idx] = digits[idx] + remainder
      return digits
    end
  end

  digits
end

p plus_one([9])
