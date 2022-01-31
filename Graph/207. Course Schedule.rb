require 'pry'

# {
#   0 => 1,
#   1 => 0
# }

# [[2,1], [1,0]]
# {
#   0 => 1,
#   1 => 2
# }
#
# [[1,0]]
# {
#   1 => 0
#   0 => nil
# }
def can_finish(num_courses, prerequisites)
  adj_list = build_adj_list(prerequisites)
  stack = [adj_list.keys.sort.first]
  taken = []

  while stack.any?
    current = stack.pop
    taken << current

    return false if taken.include? adj_list[current]
    return true if taken.length == num_courses

    stack << adj_list[current]
  end

  p taken
  taken.length == num_courses
end

def build_adj_list(prereqs)
  adj_list = {}

  prereqs.each do |pair|
    # Prereq -> course
    adj_list[pair[1]] = pair[0]
    adj_list[pair[0]] = :no_prereq
  end

  adj_list
end


