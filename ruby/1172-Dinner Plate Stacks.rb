class DinnerPlates

=begin
  :type capacity: Integer
=end
  def initialize(capacity)
    @arr = []
    @capacity = capacity
  end


=begin
  :type val: Integer
  :rtype: Void
=end
  def push(val)
    if @arr.empty?
      # create a new stack in arr
      @arr << [val]
    else
      @arr.each do |stack|
        if stack.size < @capacity
          stack << val
          return
        end
      end
      @arr << [val]
    end
  end


=begin
  :rtype: Integer
=end
  def pop()
    if @arr.empty?
      -1
    else
      @arr.reverse.each do |stack|
        if !stack.empty?
          return stack.pop
        end
      end
      -1
    end
  end


=begin
  :type index: Integer
  :rtype: Integer
=end
  def pop_at_stack(index)
    return -1 if index < 0 || index >= @arr.size
    if @arr[index].empty?
      -1
    else
      @arr[index].pop
    end
  end


end

# Your DinnerPlates object will be instantiated and called as such:
# obj = DinnerPlates.new(capacity)
# obj.push(val)
# param_2 = obj.pop()
# param_3 = obj.pop_at_stack(index)