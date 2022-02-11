require 'pry'
require 'set'

def valid_tree(n, edges)
  if edges.empty?
    valid = n == 1
    return valid
  end

  adj_list = build_adjacency_list(edges)

  stack = [{ node: adj_list.keys.first, prev: nil }]
  visited = Set.new

  while stack.any?
    current = stack.pop

    return false if visited.include?(current[:node])

    visited << current[:node]

    adj_list[current[:node]].each do |node|
      next if node == current[:prev]
      stack << { node: node, prev: current[:node] }
    end
  end

  visited.length == n
end

def build_adjacency_list(edges)
  edges.inject({}) do |adj_list, edge|
    adj_list[edge[0]] ||= []
    adj_list[edge[1]] ||= []
    adj_list[edge[0]] << edge[1]
    adj_list[edge[1]] << edge[0]
    adj_list
  end
end

p valid_tree(5, [[0,1],[0,2],[0,3],[1,4]])
p valid_tree(5, [[0,1],[1,2],[2,3],[1,3],[1,4]])
