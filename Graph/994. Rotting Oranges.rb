require 'pry'

# 1. Find every rotting orange & fresh orange
# 2. Create method to expand every rotting orange
# 3a. Check for never rotting oranges
# 3. Expand every orange
#    If a fresh orange is hit, remove it from fresh
#    orange list
#    increment minute counter
#    Continue while fresh orange list not empty
# 4. Return minute counter
#
#[[2,1,1]
# [0,1,1]
# [1,0,1]]
def oranges_rotting(grid)
  return StandardError if grid.empty? || grid.nil?

  rotten_oranges = []
  fresh_oranges  = []

  grid.each_with_index do |row, r|
    row.each_with_index do |col, c|
      rotten_oranges << [r,c] if col == 2
      fresh_oranges  << [r,c] if col == 1
    end
  end

  return 0  if fresh_oranges.empty? && rotten_oranges.empty?
  return -1 if rotten_oranges.empty?
  return 0  if fresh_oranges.empty?

  fresh_oranges.each do |rc|
    adjacent_cells = adjacent_cells(grid, rc[0], rc[1])
    adj_cells = adjacent_cells.map do |arc|
      grid[arc[0]][arc[1]]
    end

    if !adj_cells.include? 2
      if !adj_cells.include? 1
        return -1
      end
    end
  end

  minute_counter = 0

  while rotten_oranges.any?
    minute_counter += 1
    new_rotten_oranges = []

    rotten_oranges.each do |rc|
      adjacent_cells = adjacent_cells(grid, rc[0], rc[1])

      adjacent_cells.each do |arc|
        if grid[arc[0]][arc[1]] == 1
          new_rotten_oranges << arc
          fresh_oranges.delete(arc)
        end
      end

      return minute_counter if fresh_oranges.empty?
    end

    rotten_oranges = new_rotten_oranges
  end
end

# Returns array of 4 directionally adjacent cells
def adjacent_cells(grid, r, c)
  top    = [r-1,c]   if r > 0
  right  = [r,  c+1] if c < grid[0].length - 1
  bottom = [r+1,c]   if r < grid.length - 1
  left   = [r,  c-1] if c > 0

  [top,right,bottom,left].compact
end

p oranges_rotting([[2,0,1,1,1,1,1,1,1,1],[1,0,1,0,0,0,0,0,0,1],[1,0,1,0,1,1,1,1,0,1],[1,0,1,0,1,0,0,1,0,1],[1,0,1,0,1,0,0,1,0,1],[1,0,1,0,1,1,0,1,0,1],[1,0,1,0,0,0,0,1,0,1],[1,0,1,1,1,1,1,1,0,1],[1,0,0,0,0,0,0,0,0,1],[1,1,1,1,1,1,1,1,1,1]])
p oranges_rotting([[2,1,1],[1,1,0],[0,1,1]])
p oranges_rotting([[2,1,1],[0,1,1],[1,0,1]]) == -1
p oranges_rotting([[0,1]]) == 0
