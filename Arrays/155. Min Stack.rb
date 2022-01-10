class MinStack
  def initialize()
    @stack = []
    @min_stack = []
  end

=begin
    :type val: Integer
    :rtype: Void
=end
  def push(val)
    @stack << val

    if @min_stack.empty? || @min_stack[-1] >= val
      @min_stack << val
    end
  end


=begin
    :rtype: Void
=end
  def pop()
    current = @stack.pop
    if current == @min_stack[-1]
      @min_stack.pop
    end
  end


=begin
    :rtype: Integer
=end
  def top()
    @stack[-1]
  end


=begin
    :rtype: Integer
=end
  def get_min()
    @min_stack[-1]
  end
end
