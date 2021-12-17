require 'pry'

def product_except_self(nums)
  nums.each_with_index.map do |num, idx|
    clone = nums.clone
    clone.delete_at(idx)

    clone.inject(nil) do |memo, cnum|
      if memo.nil?
        memo = cnum
      else
        cnum * memo
      end
    end
  end
end

# def product_except_self(nums)
#   nums.each_with_index.map do |num, idx|
#     clone = nums.clone
#     clone.delete_at(idx)

#     nums.inject(nil) do |memo, cnum|
#       if memo.nil?
#         memo = cnum
#       else
#         cnum * memo
#       end
#     end
#   end
# end

p product_except_self([1,2,3,4]) == [24,12,8,6]
p product_except_self([-1,1,0,-3,3]) == [0,0,9,0,0]
p product_except_self([0,0]) == [0,0]
