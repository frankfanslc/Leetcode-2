require 'pry'

# Given an m x n integer matrix matrix, if an element is 0,
# set its entire row and column to 0's, and return the matrix.

# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.

# 1. O(M x N) Space Solution - OK
# def set_zeroes(matrix)
#   col_zeroes = matrix[0].length.times.map { 1 }
#   row_zeroes = matrix.length.times.map { 1 }

#   matrix.each_with_index do |row, row_idx|
#     row.each_with_index do |col, col_idx|
#       if col == 0
#         col_zeroes[col_idx] = 0
#         row_zeroes[row_idx] = 0
#       end
#     end
#   end

#   matrix.each_with_index do |row, row_idx|
#     row.each_with_index do |col, col_idx|
#       if (col_zeroes[col_idx] == 0) || (row_zeroes[row_idx] == 0)
#         matrix[row_idx][col_idx] = 0
#       end
#     end
#   end
# end

# 2. O(1) Space Solution - BEST
def set_zeroes(matrix)
  row_zero = false

  matrix.each_with_index do |row, row_idx|
    row.each_with_index do |col, col_idx|
      if col == 0
        # Update head column as zero
        matrix[0][col_idx] = 0

        # update head row as zero
        if row_idx > 0
          matrix[row_idx][0] = 0
        else
          row_zero = true
        end
      end
    end
  end

  # Set rows and cols except for the first ones
  matrix.each_with_index do |row, row_idx|
    row.each_with_index do |col, col_idx|
      if row_idx > 0 && col_idx > 0
        if (matrix[row_idx][0] == 0) || (matrix[0][col_idx] == 0)
          matrix[row_idx][col_idx] = 0
        end
      end
    end
  end

  # Set first column
  if matrix[0][0] == 0
    matrix.each_with_index do |row, row_idx|
      row.each_with_index do |col, col_idx|
        if col_idx == 0
          matrix[row_idx][col_idx] = 0
        end
      end
    end
  end

  # Set first row
  if row_zero
    matrix.each_with_index do |row, row_idx|
      row.each_with_index do |col, col_idx|
        if row_idx == 0
          matrix[row_idx][col_idx] = 0
        end
      end
    end
  end

  matrix
end



matrix = [[1,1,1],
          [1,0,1],
          [1,1,1]]

output = [[1,0,1],
          [0,0,0],
          [1,0,1]]

p set_zeroes(matrix) == output
p set_zeroes(matrix)

matrix = [[0,1,2,0],
          [3,4,5,2],
          [1,3,1,5]]

output = [[0,0,0,0],
          [0,4,5,0],
          [0,3,1,0]]

p set_zeroes(matrix) == output
p set_zeroes(matrix)
