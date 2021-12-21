require 'pry'

def character_replacement(str, k)
  # Find longest repeating substring with at most
  # k letters that could be switched
  #
  # 1. Find every unique character and put index + edges into a hash map
  # 2. Calculate the empty space in between, add edges if remaining k
  # 3. If less than k and longest, this is the result

  chars = str.chars
  left = 0
  right = left + 1
  longest = 0

  chars.each_with_index do |num, idx|
    current = 0
    current_k = k

    while right < (chars.length - 1) && current_k > 1
      if chars[left] == chars[right]
        current +=1
        right +=1
      else
        current += 1
        right +=1
        current_k -= 1

        if current > longest
          longest = current
        end

        # Handle edges
        if (right == chars.length - 1) && current_k > 1 && current < chars.length - 1
          # k = 3
          # current = 7
          # current_k = 1
          # length = 9
          # [A, A, B, B, A, B, B, B, A]
          longest += (str.length - current) - current_k
        end
      end
    end
  end

  p longest
end

p character_replacement("ABAB", 2) == 4
p character_replacement("AABABBA", 1) == 4
