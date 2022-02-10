require 'pry'

def add_digits(num)
  return num.digits.sum if num.digits.uniq.length == 1
  binding.pry
  add_digits(num.digits.sum)
end

p add_digits(55)
