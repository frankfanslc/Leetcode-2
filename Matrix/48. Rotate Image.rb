require 'pry'

# O(1) Space complexity
def rotate(matrix)
  #  ROW 1
  #  [[0,0] -> [0,2], = [+0, +2]
  #   [0,1] -> [1,2], = [+1, +1]
  #   [0,2] -> [2,2]] = [+2, +0]
  #
  #  ROW 2
  #  [[1,0] -> [0,1], = [-1, +1]
  #   [1,1] -> [1,1], = [+0, +0]
  #   [1,2] -> [2,1]] = [+1, -1]
  #
  #  ROW 3
  #  [[2,0] -> [0,0], = [-2, +0]
  #   [2,1] -> [1,0], = [-1, -1]
  #   [2,2] -> [2,0]] = [+0, -2]

  # Move as far right as possible
  # Move as far up as possible
  # Store the previous number in a separate Matrix
  # If separate Matrix has a number, use that number instead

  width = matrix[0].length - 1
  store = matrix.length.times.map { [] }

  matrix.each_with_index do |row, row_idx|
    row.each_with_index do |col, col_idx|
      if store[row_idx][col_idx]
        # Store original configuration
        store[col_idx][width - row_idx] = matrix[col_idx][width - row_idx]

        # Use stored number from original configuration
        matrix[col_idx][width - row_idx] = store[row_idx][col_idx]
      else
        # Store original configuration
        store[col_idx][width - row_idx] = matrix[col_idx][width - row_idx]

        # No stored number so OK to use Matrix value
        matrix[col_idx][width - row_idx] = matrix[row_idx][col_idx]
      end
    end
  end
end

matrix = [[1,2,3],
          [4,5,6],
          [7,8,9]]

output = [[7,4,1],
          [8,5,2],
          [9,6,3]]

p rotate(matrix) == output
p rotate(matrix)

matrix = [[5,1,9,11],
          [2,4,8,10],
          [13,3,6,7],
          [15,14,12,16]]

output = [[15,13,2,5],
          [14,3,4,1],
          [12,6,8,9],
          [16,7,10,11]]

p rotate(matrix) == output
p rotate(matrix)
