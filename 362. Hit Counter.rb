require 'pry'

class HitCounter
  MAX_INTERVAL = 300

  def initialize()
    @hits = {}
  end

  def hit(timestamp)
    if @hits[timestamp]
      @hits[timestamp] += 1
    else
      @hits[timestamp] = 1
    end
  end

  def get_hits(timestamp)
    limit = timestamp - MAX_INTERVAL
    limit = limit > 0 ? limit : 0

    @hits.select.map do |k,v|
      v if k > limit
    end.compact.sum
  end
end

hc = HitCounter.new
hc.hit(1)
hc.hit(2)
hc.hit(3)
p hc.get_hits(4)
hc.hit(300)
p hc.get_hits(300)
p hc.get_hits(301)

