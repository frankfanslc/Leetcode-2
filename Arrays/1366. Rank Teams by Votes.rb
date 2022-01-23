require 'pry'

def rank_teams(votes)
  return StandardError if votes.empty? || votes.nil?
  return votes.first if votes.count <= 1

  scores = {}
  vote_length = votes.first.length

  votes.each do |vote|
    vote.chars.each_with_index do |char, idx|
      scores[char] ||= vote_length.times.map { |num| 0 }
      scores[char][idx] += 1
    end
  end

  scores.sort_by do |k,v|
    i = -1
    sort_key = v.length.times.map do
      i += 1
      -v[i]
    end

    sort_key << -k
    sort_key
  end.map do |k,v|
    k
  end.join("")
end

votes = ["WXYZ","XYZW"]
p rank_teams(votes) == "XWYZ"

votes = ["ABC","ACB","ABC","ACB","ACB"]
p rank_teams(votes) == "ACB"

# W = 4 + 1 = 5
# X = 3 + 4 = 7
# Y = 2 + 3 = 5
# Z = 1 + 2 = 3

# {"W"=>3, "X"=>5, "Y"=>3, "Z"=>1}

# XWYZ



