require 'pry'

def walls_and_gates(rooms)

end

rooms = [[2147483647,-1,0,2147483647],
         [2147483647,2147483647,2147483647,-1],
         [2147483647,-1,2147483647,-1],
         [0,-1,2147483647,2147483647]]
output = [[3,-1,0,1],
          [2,2,1,-1],
          [1,-1,2,-1],
          [0,-1,3,4]]
p walls_and_gates(rooms)
