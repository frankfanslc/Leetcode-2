require 'pry'

def min_knight_moves(x, y)
  seen  = Hash.new
  queue = [[0,0]]
  moves = 0

  while queue.any?
    current_moves_count = queue.length

    current_moves_count.times do
      current = queue.pop

      return moves if current == [x,y]

      possible_moves(current).each do |xy|
        if seen[xy].nil?
          queue.prepend xy
        end
      end

      seen[current] == true
    end

    moves += 1
  end
end

def possible_moves(xy)
  [
   # Top right
   [xy[0] - 2, xy[1] + 1],
   [xy[0] - 1, xy[1] + 2],

   # Bottom right
   [xy[0] + 1, xy[1] + 2],
   [xy[0] + 2, xy[1] + 1],

   # Bottom left
   [xy[0] + 2, xy[1] - 1],
   [xy[0] + 1, xy[1] - 2],

   # Top left
   [xy[0] - 1, xy[1] - 2],
   [xy[0] - 2, xy[1] - 1],
  ]
end

p min_knight_moves(2, 1)
p min_knight_moves(5, 5)
p min_knight_moves(1, 3)
p min_knight_moves(2, 8)
