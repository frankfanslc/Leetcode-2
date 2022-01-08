require 'pry'

def can_place_flowers(flowerbed, n)
  return false if flowerbed.nil? || flowerbed.empty?
  return true if n.nil? || n <= 0

  length = flowerbed.length - 1
  count = 0

  flowerbed.each_with_index do |flower, idx|
    if flower == 0
      if flowerbed[idx-1] == 0 && flowerbed[idx + 1] == 0
        flowerbed[idx] = 1
        count += 1
      elsif idx == 0 && flowerbed[idx + 1] == 0
        count +=  1
      elsif idx == length && flowerbed[idx - 1] == 0
        count += 1
      else
        next
      end
    end
  end

  count >= n
end

p can_place_flowers([1,0,0,0,1], 2) == false
