require 'pry'

def maximum_units(box_types, truck_size)
  box_types = box_types.sort_by do |box|
    box[1]
  end.reverse

  units = 0
  idx = 0

  while truck_size > 0 && idx <= box_types.length - 1
    if box_types[idx][0] > 0
      units += box_types[idx][1]
      box_types[idx][0] -= 1
      truck_size -= 1
    else
      idx += 1
    end
  end

  units
end

# p maximum_units([[1,3],[2,2],[3,1]], 4)
p maximum_units([[1,3],[5,5],[2,5],[4,2],[4,1],[3,1],[2,2],[1,3],[2,5],[3,2]], 35)
