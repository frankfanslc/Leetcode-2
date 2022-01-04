require 'pry'

def guessNumber(n)
  left = 1
  right = n

  while left <= right
    mid = (left + right) / 2
    guess = guess(mid)

    if guess == -1
      right = mid - 1
    elsif guess == 1
      left = mid + 1
    else
      return mid
    end
  end
end

p guessNumber(10)
