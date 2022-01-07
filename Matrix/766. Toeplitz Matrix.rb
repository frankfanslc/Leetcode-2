require 'pry'

def is_toeplitz_matrix(matrix)
  return false if matrix.nil? || matrix.empty?
  return true if matrix[0].length <= 1

  matrix.each_with_index do |row, r|
    row.each_with_index do |col, c|
      next if matrix[r+1].nil?
      next if matrix[r][c+1].nil?

      return false if matrix[r][c] != matrix[r+1][c+1]
    end
  end

  true
end

matrix = [[1,2,3,4],
          [5,1,2,3],
          [9,5,1,2]]
p is_toeplitz_matrix(matrix) == true

matrix = [[11,74,0,93],
          [40,11,74,7]]
p is_toeplitz_matrix(matrix) == false

matrix = [[18],
          [66]]
p is_toeplitz_matrix(matrix) == true

matrix = [[57,54],
          [84,57]]
p is_toeplitz_matrix(matrix) == true
