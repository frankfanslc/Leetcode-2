require 'pry'

class Node
  attr_accessor :val, :neighbors

  def initialize(val = 0, neighbors = nil)
    @val = val
    neighbors = [] if neighbors.nil?
    @neighbors = neighbors
  end
end

def cloneGraph(node)
  stack = [node]
  visited = {}

  while stack.any?
    current = stack.pop

    clone = Node.new(current.val)
    visited[current] = clone

    current.neighbors.each do |neighbor|
      return visited[neighbor] if visited[neighbor]
      stack << neighbor
      clone.neighbors << cloneGraph(neighbor)
    end

    clone
  end
end

def cloneGraph(node)
  return nil if node.nil? == nil

  @hash = {}

  dfs(node)
end

def dfs(node)
  return @hash[node] if @hash[node]

  clone = Node.new(node.val)
  @hash[node] = clone

  node.neighbors.each do |neighbor|
    clone.neighbors << dfs(neighbor)
  end

  clone
end
