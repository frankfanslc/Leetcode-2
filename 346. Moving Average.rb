require 'pry'

class MovingAverage
  def initialize(size)
    @size = size
    @values = []
  end

  def next(val)
    @values << val

    if @values.length <= @size
      (@values[-@values.length..-1].sum / @values.length.to_f)
    else
      @values.shift
      (@values.sum / @values.length.to_f)
    end
  end
end

movingAverage = MovingAverage.new(3)
movingAverage.next(1)
movingAverage.next(10)
movingAverage.next(3)
movingAverage.next(5)
