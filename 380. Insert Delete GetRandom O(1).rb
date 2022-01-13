class RandomizedSet
  def initialize()
    @set = {}
  end


=begin
    :type val: Integer
    :rtype: Boolean
=end
  def insert(val)
    if @set[val]
      false
    else
      @set[val] = val
      true
    end
  end


=begin
    :type val: Integer
    :rtype: Boolean
=end
  def remove(val)
    if @set[val]
      @set.delete(@set[val])
      true
    else
      false
    end
  end


=begin
    :rtype: Integer
=end
  def get_random()
    @set[@set.keys.sample]
  end
end
