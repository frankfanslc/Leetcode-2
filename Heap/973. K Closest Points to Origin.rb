require 'pry'

# O(n log n)
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

class Point
  attr_accessor :x, :y, :val

  def initialize(x, y)
    @x = x
    @y = y
    @val = [x,y]
  end

  def <=>(other)
    euclidean_distance <=> other.euclidean_distance
  end

  def euclidean_distance
    Math.sqrt((x * x) + (y * y))
  end
end

# O(n log k)
def k_closest(points, k)
  return [] if points.empty? || points.nil?
  return StandardError if k.nil?

  result = []

  points.each do |point|
    point = Point.new(point[0], point[1])

    result << point

    if result.length > k
      result.sort!
      result.pop
    end
  end

  result.map(&:val)
end

points = [[1,3],[-2,2]]
p k_closest(points, 1) == [[-2,2]]
