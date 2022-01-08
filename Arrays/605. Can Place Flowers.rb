require 'pry'

def can_place_flowers(flowerbed, n)
  return false if flowerbed.nil? || flowerbed.empty?
  return true if n.nil? || n <= 0

  count = 0

  flowerbed.each do |flower|
    count += 1 if flower == 0
  end

  (count / 2) >= n
end

p can_place_flowers([1,0,0,0,1], 2) == false
