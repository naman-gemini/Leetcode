class StockSpanner
  def initialize()
    @stack = []
    @prices = []
    @count = 0
  end

=begin
    :type price: Integer
    :rtype: Integer
=end
  def next(price)
    while !@stack.empty? && @prices[@stack[-1]] <= price
      @stack.pop
    end
    ret = @stack.empty? ? (@count + 1) : @count - @stack[-1]
    
    @stack.push(@count)
    @prices.push(price)
    @count += 1

    ret
  end

end

# Your StockSpanner object will be instantiated and called as such:
# obj = StockSpanner.new()
# param_1 = obj.next(price)