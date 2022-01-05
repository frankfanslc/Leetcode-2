require 'pry'

def num_islands(grid)
  areas = []
  @visited = []

  grid.each_with_index do |row, r|
    row.each_with_index do |col, c|
      next if col == "0"
      next if @visited.include?([r,c])

      if col == "1"
        area = dfs(grid, [r,c], @visited)
        areas << area
      end
    end
  end

  areas.length
end

def dfs(grid, node, visited)
  area = 0
  @visited << node
  stack = [node]

  while stack.length > 0
    current = stack.pop
    area += 1
    row = current[0]
    col = current[1]

    top    = [row-1, col]   if row > 0
    right  = [row,   col+1] if col < grid[0].length - 1
    bottom = [row+1, col]   if row < grid.length - 1
    left   = [row,   col-1] if col > 0

    neighbors = [top, right, bottom, left].compact

    neighbors.each do |neighbor|
      row = neighbor[0]
      col = neighbor[1]

      if grid[row][col] == "1" && !@visited.include?(neighbor)
        stack << neighbor
      end

      @visited << neighbor
    end
  end

  area
end
