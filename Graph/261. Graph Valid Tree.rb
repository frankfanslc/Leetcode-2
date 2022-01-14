require 'pry'

# Valid tree:
#  - no cycles
#  - no islands
def valid_tree(n, edges)
  return StandardError if n.nil? || edges.nil?

  # {
  #   0 => [1, 2, 3],
  #   1 => [0, 4],
  #   2 => [0],
  #   3 => [0],
  #   4 => [1]
  # }
  #
  # {
  #   0 => [1],
  #   1 => [0, 2, 3, 4],
  #   2 => [1, 3],
  #   3 => [2, 1],
  #   4 => [1]
  # }
  adj_list = build_adjacency_list(n, edges)

  visited = []
  trees = 0

  (n-1).times do |node|
    next if visited.include? node

    stack = [node]

    while stack.any?
      current = stack.pop

      adj_list[current].each do |node|
        if !visited.include? node
          stack << node
        end
      end

      visited << current

      if stack.empty?
        trees += 1
      end
    end
  end

  trees == 1
end

def build_adjacency_list(n, edges)
  adj_list = {}

  edges.each do |edge|
    adj_list[edge[0]] ||= []
    adj_list[edge[1]] ||= []

    adj_list[edge[0]] << edge[1]
    adj_list[edge[1]] << edge[0]
  end

  adj_list
end

p valid_tree(5, [[0,1],[0,2],[0,3],[1,4]])
p valid_tree(5, [[0,1],[1,2],[2,3],[1,3],[1,4]])
