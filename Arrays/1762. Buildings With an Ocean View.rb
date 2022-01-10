require 'pry'

def find_buildings(heights)
  return nil if heights.empty? || heights.nil?

  length = heights.length - 1
  ocean_views = []
  max_height = 0

  heights.each_with_index do |height, idx|
    ridx = length - idx
    height = heights[ridx]

    ocean_views << ridx if (max_height || 0) < height
    max_height = height if height > max_height
  end

  ocean_views.sort
end

p find_buildings([4,2,3,1])
