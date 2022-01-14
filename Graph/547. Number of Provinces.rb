require 'pry'

def find_circle_num(is_connected)
  return 0 if is_connected.nil? || is_connected.empty?

  adj_list = build_adj_list(is_connected)

  visited = []
  provinces = 0

  adj_list.length.times do |node|
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

      # Traversal for this node/province is complete
      if stack.empty?
        provinces += 1
      end
    end
  end

  provinces
end

def build_adj_list(is_connected)
  # {
  #   1 => [2],
  #   2 => [1],
  #   3 => []
  # }
  adj_list = {}

  is_connected.each_with_index do |row, ridx|
    row.each_with_index do |col, cidx|
      if col == 1
        adj_list[ridx] ||= []

        if cidx != ridx
          adj_list[ridx] << cidx
        end
      end
    end
  end

  adj_list
end

p find_circle_num([[1,1,0],
                   [1,1,0],
                   [0,0,1]])
# p find_circle_num([[1,0,0],[0,1,0],[0,0,1]])
