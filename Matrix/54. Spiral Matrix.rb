require 'pry'

# @param {Integer[][]} matrix
# @return {Integer[]}
def spiral_order(matrix)
  # 1. First row, first column to last column
  # 2. Last column, first row to last row
  # 3. Last row, last column to first column
  # 4. First column, last row to first row
  # REPEAT

  fr = 0
  lc = matrix[0].length - 1
  lr = matrix.length - 1
  fc = 0

  row_counter = 0
  row_limit = matrix.length

  col_counter = 0
  col_limit = matrix[0].length

  res = []

  while row_counter < row_limit do
    res << matrix[fr][fc..lc]
    fr += 1
    row_counter += 1
    break if row_counter == row_limit

    res << matrix[fr..lr].map { |row| row[lc] }
    lc -= 1
    col_counter += 1
    break if col_counter == col_limit

    res << matrix[lr][fc..lc].reverse
    lr -= 1
    row_counter +=1
    break if row_counter == row_limit

    res << matrix[fr..lr].reverse.map { |row| row[fc] }
    fc += 1
    col_counter += 1
    break if col_counter == col_limit
  end

  res.flatten
end

matrix = [[1,2,3],
          [4,5,6],
          [7,8,9]]
output =  [1,2,3,6,9,8,7,4,5]
p spiral_order(matrix) == output
p spiral_order(matrix)

matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
output = [1,2,3,4,8,12,11,10,9,5,6,7]
p spiral_order(matrix) == output
p spiral_order(matrix)

matrix = [[3],[2]]
output = [3,2]
p spiral_order(matrix) == output
p spiral_order(matrix)
