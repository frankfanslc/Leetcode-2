require 'pry'

EMPTY_ROOM = (2**31 - 1)
GATE = 0

def walls_and_gates(rooms)
  return rooms if rooms.nil? || rooms.empty?

  gates_queue = []

  rooms.each_with_index do |row, ridx|
    row.each_with_index do |col, cidx|
      gates_queue << [ridx, cidx] if col == GATE
    end
  end

  current_distance = 1
  gates_queue << :increment

  while gates_queue.any?
    current = gates_queue.shift

    if current == :increment
      if gates_queue.empty?
        return rooms
      else
        gates_queue << :increment
        current_distance += 1
        next
      end
    end

    adjacent_rooms = adjacent_rooms(rooms, current[0], current[1])
    adjacent_rooms.each do |room|
      next if rooms[room[0]][room[1]] != EMPTY_ROOM

      rooms[room[0]][room[1]] = current_distance
      gates_queue << room
    end
  end

  rooms
end

def adjacent_rooms(rooms, row, col)
  cells = []
  cells << [row-1, col] if row > 0
  cells << [row, col+1] if col < rooms[0].length - 1
  cells << [row+1, col] if row < rooms.length - 1
  cells << [row, col-1] if col > 0
  cells
end

rooms = [[2147483647,-1,0,2147483647],
         [2147483647,2147483647,2147483647,-1],
         [2147483647,-1,2147483647,-1],
         [0,-1,2147483647,2147483647]]
output = [[3,-1,0,1],
          [2,2,1,-1],
          [1,-1,2,-1],
          [0,-1,3,4]]
p walls_and_gates(rooms) == output
