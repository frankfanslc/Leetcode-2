require 'pry'

def get_sum(a, b)
  pos_res = []
  neg_res = []

  if a > 0
    a.times do |x|
      if neg_res.length > 0
        neg_res.pop
      else
        pos_res << x
      end
    end
  else
    a.abs.times do |x|
      if pos_res.length > 0
        pos_res.pop
      else
        neg_res << x
      end
    end
  end

  if b > 0
    b.times do |x|
      if neg_res.length > 0
        neg_res.pop
      else
        pos_res << x
      end
    end
  else
    b.abs.times do |x|
      if pos_res.length > 0
        pos_res.pop
      else
        neg_res << x
      end
    end
  end

  if pos_res.length > neg_res.length
    pos_res.length
  else
    -neg_res.length
  end
end

p get_sum(1, 2) == 3
p get_sum(2, 3) == 5
p get_sum(-1, 1) == 0
p get_sum(-12, -8) == -20
