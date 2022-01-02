require 'pry'

def exist(board, word)
  chars = word.chars
  curr_chars_idx = 0

  # 1. Start with [0,0]
  # 2. If first letter of WORD
  #     - Find valid next cells
  #       - If valid cell -> continue
  #       - If no valid cell -> repeat 1 at [0,1]
  #    If not first letter of WORD -> repeat 1 at [0,1]

  board.each_with_index do |row, r|
    row.each_with_index do |col, c|
      if board[r][c] == chars[curr_chars_idx]
        result = traverse_path(r, c, board, chars, curr_chars_idx)
      end

      return true if result
    end
  end

  false
end

def traverse_path(r, c, board, chars, curr_chars_idx)
  chars_limit = chars.length - 1
  if curr_chars_idx + 1 == chars_limit
    return true
  end

  top_border     = 0
  right_border   = board[0].length - 1
  bottom_border  = board.length - 1
  left_border    = 0


  # up
  if r > top_border
    if board[r-1][c] == chars[curr_chars_idx + 1]
      return traverse_path(r-1, c, board, chars, curr_chars_idx + 1)
    end
  end

  # right
  if c < right_border
    if board[r][c+1] == chars[curr_chars_idx + 1]
      return traverse_path(r, c+1, board, chars, curr_chars_idx + 1)
    end
  end

  # down
  if r < bottom_border
    if board[r+1][c] == chars[curr_chars_idx + 1]
      return traverse_path(r+1, c, board, chars, curr_chars_idx + 1)
    end
  end

  # left
  if c > left_border
    if board[r][c-1] == chars[curr_chars_idx + 1]
      return traverse_path(r, c-1, board, chars, curr_chars_idx + 1)
    end
  end

  curr_chars_idx = 0
  false
end

board = [["A","B","C","E"],
         ["S","F","C","S"],
         ["A","D","E","E"]]

word = "ABCCED"
output = true
p exist(board, word) == output





board = [["A","B","C","E"],
         ["S","F","C","S"],
         ["A","D","E","E"]]

word = "SEE"
output = true
p exist(board, word) == output





board = [["A","B","C","E"],
         ["S","F","C","S"],
         ["A","D","E","E"]]

word = "ABCB"
output = false
p exist(board, word) == output
