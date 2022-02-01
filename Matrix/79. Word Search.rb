require 'pry'

def exist(board, word)
  original_word = word

  board.each_with_index do |row, ridx|
    row.each_with_index do |col, cidx|
      return true if dfs(board, [ridx, cidx], word.chars)
      word = original_word # reset for next iteration
    end
  end

  false
end

def dfs(board, coords, word)
  stack = [coords] # [0, 0]
  visited = []

  while stack.any?
    current = stack.pop
    visited << current

    if board[current[0]][current[1]] == word[0]
      word.shift
      stack << [current[0],    current[1] + 1] if current[1] + 1 < board[0].length  # right
      stack << [current[0] + 1,current[1]]     if current[0] + 1 < board.length     # down
      stack << [current[0],    current[1] - 1] if current[1] - 1 >= 0               # left
      stack << [current[0] - 1,current[1]]     if current[0] - 1 >= 0               # up

      stack.each do |coord|
        if visited.include? coord
          stack.delete(coord)
        end
      end
    else
      visited.pop
    end
  end

  word.empty?
end

board = [["C","A","A"],
         ["A","A","A"],
         ["B","C","D"]]
word = "AAB"
output = true
p exist(board, word) == output

# board = [["A","B"],["C","D"]]
# word = "ABDC"
# output = true
# p exist(board, word) == output

# board = [["A","B"]]
# word = "BA"
# output = true
# p exist(board, word) == output

# board = [["A","B","C","E"],
#          ["S","F","C","S"],
#          ["A","D","E","E"]]

# word = "ABCCED"
# output = true
# p exist(board, word) == output

# board = [["A","B","C","E"],
#          ["S","F","C","S"],
#          ["A","D","E","E"]]

# word = "SEE"
# output = true
# p exist(board, word) == output

# board = [["A","B","C","E"],
#          ["S","F","C","S"],
#          ["A","D","E","E"]]

# word = "ABCB"
# output = false
# p exist(board, word) == output
