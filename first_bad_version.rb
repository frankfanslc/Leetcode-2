require 'pry'

# The is_bad_version API is already defined for you.
# @param {Integer} version
# @return {boolean} whether the version is bad
def is_bad_version(version)
  version >= 4
end

# @param {Integer} n
# @return {Integer}
def first_bad_version(n)
  left = 1
  right = n

  while left <= right
    mid = left + (right - left) / 2

    if is_bad_version(mid)
      right = mid - 1
      first_bad_version = mid
    else
      left = mid + 1
    end
  end

  first_bad_version
end

# Input: n = 5, bad = 4
# Output: 4
# Explanation:
# call isBadVersion(3) -> false
# call isBadVersion(5) -> true
# call isBadVersion(4) -> true
# Then 4 is the first bad version.
p first_bad_version(5) == 4
# p first_bad_version(1) == 1
