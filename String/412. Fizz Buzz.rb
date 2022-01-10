require 'pry'

def fizz_buzz(n)
  (1..n).to_a.map do |num|
    three = (num % 3 == 0)
    five  = (num % 5 == 0)

    if three && five
      'FizzBuzz'
    elsif three
      'Fizz'
    elsif five
      'Buzz'
    else
      num.to_s
    end
  end
end

p fizz_buzz(3)
