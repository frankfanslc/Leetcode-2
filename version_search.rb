require 'pry'

def is_valid?(version)
  version <= 6
end

def has_invalid_version(versions:)
  left = 0
  right = versions.length - 1
  results = []

  while left <= right
    mid = (right + left) / 2

  binding.pry

    if is_valid?(versions[mid])
      left = mid + 1
    else
      right = mid - 1
      results << versions[mid]
    end
  end
  results.any?
end

# p has_invalid_version(versions: [1,2,3,4,5,6,7,8,9]) == true
# p has_invalid_version(versions: [1,2,3,4]) == false
# p has_invalid_version(versions: [6,7,8]) == true
p has_invalid_version(versions: [6]) == true
# p has_invalid_version(versions: [7,8,9]) == false
