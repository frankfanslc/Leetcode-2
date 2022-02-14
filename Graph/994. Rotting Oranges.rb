require 'pry'

# 1. Find every rotting orange & fresh orange
# 2. Create method to expand every rotting orange
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
  return 0 if grid.empty? || grid.nil?

  rotten_oranges_queue = []
  fresh_oranges = []

  # Separate the rotten and fresh oranges -> O(n)
  grid.each_with_index do |row, r|
    row.each_with_index do |col, c|
      rotten_oranges_queue << [r,c] if col == 2
      fresh_oranges  << [r,c] if col == 1
    end
  end

  # Early returns for specific edge cases
  return 0  if fresh_oranges.empty? && rotten_oranges_queue.empty?
  return -1 if rotten_oranges_queue.empty?
  return 0  if fresh_oranges.empty?

  min_counter = 0
  rotten_oranges_queue << :end_minute # Sentinal node to indicate a min has elapsed

  # Do a BFS on rotten oranges
  while rotten_oranges_queue.any?
    current = rotten_oranges_queue.shift

    if current == :end_minute
      if rotten_oranges_queue.empty?
        if fresh_oranges.empty? # Successfully turned all oranges rotten
          return min_counter
        else
          return -1 # Fresh oranges remain but no more rotten oranges -> impossible scenario
        end
      else # More rotten oranges added and fresh oranges remaining
        min_counter += 1
        rotten_oranges_queue << :end_minute
        next
      end
    end

    adjacent_cells = adjacent_cells(grid, current[0], current[1])
    adjacent_cells.each do |cell|
      if fresh_oranges.include? cell
        rotten_oranges_queue << cell
        fresh_oranges.delete(cell)
      end
    end
  end
end

# Returns array of 4 directionally adjacent cells while
# removing boundaries
def adjacent_cells(grid, r, c)
  top    = [r-1,c]   if r > 0
  right  = [r,  c+1] if c < grid[0].length - 1
  bottom = [r+1,c]   if r < grid.length - 1
  left   = [r,  c-1] if c > 0

  [top,right,bottom,left].compact
end

p oranges_rotting([[2,1,1],[1,1,0],[0,1,1]]) == 4
p oranges_rotting([[2,1,1],[0,1,1],[1,0,1]]) == -1
p oranges_rotting([[0,1]]) == -1
p oranges_rotting([[0,2]]) == 0
