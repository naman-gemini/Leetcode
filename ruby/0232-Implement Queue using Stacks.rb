class MyQueue

=begin
  Initialize your data structure here.
=end
  def initialize()
    @stack_1 = []
    @stack_2 = []
  end


=begin
  Push element x to the back of queue.
  :type x: Integer
  :rtype: Void
=end
  def push(x)
    @stack_1 << x
  end


=begin
  Removes the element from in front of queue and returns that element.
  :rtype: Integer
=end
  def pop()
    if @stack_2.empty?
      # move all elements from stack_1 to stack_2
      @stack_2 << @stack_1.pop while !@stack_1.empty?
    end
    @stack_2.pop
  end


=begin
  Get the front element.
  :rtype: Integer
=end
  def peek()
    if @stack_2.empty?
      # move all elements from stack_1 to stack_2
      @stack_2 << @stack_1.pop while !@stack_1.empty?
    end
    @stack_2.last
  end


=begin
  Returns whether the queue is empty.
  :rtype: Boolean
=end
  def empty()
    @stack_1.empty? && @stack_2.empty?
  end


end

# Your MyQueue object will be instantiated and called as such:
# obj = MyQueue.new()
# obj.push(x)
# param_2 = obj.pop()
# param_3 = obj.peek()
# param_4 = obj.empty()