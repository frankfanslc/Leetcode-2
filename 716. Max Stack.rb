require 'pry'

class MaxStack
  def initialize()
    @stack = []
    @max_stack = []
  end

  def push(x)
    if @max_stack.any?
      if x > peek_max
        @max_stack << x
      else
        @max_stack << peek_max
      end
    else
      @max_stack << x
    end

    @stack << x
  end

  def pop()
    @max_stack.pop
    @stack.pop
  end

  def top()
    @stack[-1]
  end

  def peek_max()
    @max_stack[-1]
  end

  def pop_max()
    max = peek_max
    temp_stack = []

    while peek_max != top
      temp_stack << pop
    end

    pop

    temp_stack.reverse.each do |x|
      @stack << x
      @max_stack << x
    end

    max
  end
end

class MaxStack
  def initialize
    @max_stack = []
    @stack = []
  end

  def push(x)
    max = if @max_stack.empty?
            x
          else
            @max_stack[-1]
          end

    if x > max
      @max_stack << x
    else
      @max_stack << max
    end

    @stack << x
  end

  def pop
    @max_stack.pop
    @stack.pop
  end

  def top
    @stack[-1]
  end

  def peek_max
    @max_stack[-1]
  end

  def pop_max
    max = peek_max
    temp = []
    temp << pop while top != max

    pop

    push(temp.pop) until temp.empty?

    max
  end
end

obj = MaxStack.new()
binding.pry
# obj.push(5)
# obj.push(1)
# obj.push(5)
# param_2 = obj.pop()
# param_3 = obj.top()
# param_4 = obj.peek_max()
# param_5 = obj.pop_max()
