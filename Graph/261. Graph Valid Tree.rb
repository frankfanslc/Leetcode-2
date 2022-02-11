require 'pry'

# Valid tree:
#  - no cycles
#  - no islands
def valid_tree(n, edges)
  raise StandardError if n.nil? || edges.nil?

  # {
  #   0 => [1, 2, 3],
  #   4 => [1]
  # }
  adj_list = build_adjacency_list(n, edges)

  visited = []

  dfs(adj_list, visited)
end

def build_adjacency_list(n, edges)
  adj_list = {}

  edges.each do |edge|
    adj_list[edge[0]] ||= []
    adj_list[edge[0]] << edge[1]
  end

  adj_list
end

def dfs(adj_list, visited)
  return if

end

p valid_tree(5, [[0,1],[0,2],[0,3],[1,4]])
p valid_tree(5, [[0,1],[1,2],[2,3],[1,3],[1,4]])
