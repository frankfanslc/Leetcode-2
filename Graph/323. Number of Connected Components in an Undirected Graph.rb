require 'pry'

def count_components(n, edges)
  return StandardError if n.nil? || edges.nil?

  adj_list   = build_adj_list(n, edges)
  visited    = []
  components = 0

  n.times do |node|
    next if visited.include? node

    stack = [node]

    while stack.any?
      current = stack.pop
      visited << current

      adj_list[current].each do |node|
        if !visited.include?(node)
          stack << node
        end
      end

      visited << current

      if stack.empty?
        components += 1
      end
    end
  end

  components
end

def build_adj_list(n, edges)
  adj_list = {}

  # Initialize adj_list
  n.times do |node|
    adj_list[node] ||= []
  end

  # Populate adj_list
  adj_list.each do |k,v|
    edges.each do |edge|
      if edge[0] == k
        v << edge[1]
      elsif edge[1] == k
        v << edge[0]
      end
    end
  end

  adj_list
end

p count_components(5, [[0,1],[1,2],[3,4]])
p count_components(5, [[0,1],[1,2],[0,2],[3,4]])
