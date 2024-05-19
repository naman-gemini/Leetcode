class MinStack

=begin
  initialize your data structure here.
=end
  def initialize()
    @stack = []
    @min_stack = []
  end


=begin
  :type x: Integer
  :rtype: Void
=end
  def push(x)
    @stack << x
    @min_stack << x if @min_stack.empty? || x <= @min_stack.last
  end


=begin
  :rtype: Void
=end
  def pop()
    @min_stack.pop if @stack.pop == @min_stack.last
  end


=begin
  :rtype: Integer
=end
  def top()
    @stack.last
  end


=begin
  :rtype: Integer
=end
  def get_min()
    @min_stack.last
  end

end