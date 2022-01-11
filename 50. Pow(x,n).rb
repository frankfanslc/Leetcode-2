require 'pry'

def my_pow(x, n)
  if x < 0
    x = 1 / x
    n = -n
  end

  (1..n).to_a.inject(1) do |memo, _n|
    memo = memo * x
  end
end

p my_pow(2.00000, 10) == 1024.00000
p my_pow(2.00000, 10)

p my_pow(2.10000, 3) == 9.26100
p my_pow(2.10000, 3)
