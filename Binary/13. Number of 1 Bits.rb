require 'pry'

CACHE = {}

# Does not work in Ruby as Ruby coerces unsigned
# integers into signed integers
def hamming_weight(n)
  return CACHE[n] if CACHE[n]

  string_ints = n.to_s.chars

  signed_bits = string_ints.reject do |x|
    x.to_i == 0
  end

  CACHE[n] = signed_bits.length
  CACHE[n]
end

# def hamming_weight(n)
#   counter = 0

#   while n > 0
#     n = n & (n-1)
#     counter += 1
#   end

#   counter
# end

p hamming_weight(00000000000000000000000000001011) == 3
p hamming_weight(00000000000000000000000010000000) == 1
p hamming_weight(11111111111111111111111111111101) == 31
