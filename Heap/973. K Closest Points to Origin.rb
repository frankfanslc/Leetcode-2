require 'pry'

def k_closest(points, k)
  return [] if points.empty? || points.nil?
  return StandardError if k.nil?

  points.inject([]) do |freq, point|
    freq << [point, euclidean_distance(point[0], point[1])]
    freq
  end.sort_by do |k,v|
    v
  end[0..k-1].map(&:first)
end

def euclidean_distance(x, y)
  Math.sqrt((x * x) + (y * y)).abs
end

points = [[1,3],[-2,2]]
p k_closest(points, 1) == [[-2,2]]

points =
[[2,2],[2,2],[3,3],[2,-2],[1,1]]
