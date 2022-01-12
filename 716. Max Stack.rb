require 'pry'

class MaxStack
  def initialize()
    @stack = []
    @max_stack = []
  end

  def push(x)
    if @max_stack.empty?
      @max_stack << x
    elsif x >= @max_stack[-1]
      @max_stack << x
    else
      @max_stack.prepend(x)
    end

    @stack << x
  end

  def pop()
    current = @stack.pop
    current
  end

  def top()
    @stack[-1]
  end

  def peek_max()
    if @max_stack.any?
      @max_stack[-1]
    end
  end

  def pop_max()
    @stack.delete_at(@stack.index(@max_stack[-1]) || @stack.length)
    max = @max_stack.pop
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
