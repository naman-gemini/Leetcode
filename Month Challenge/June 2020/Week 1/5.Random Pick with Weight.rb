class Solution

=begin
    :type w: Integer[]
=end
  def initialize(w)
    @arr = []
    sum = 0
    w.each_with_index do |num, i|
      sum += num
      @arr << sum
    end
  end


=begin
    :rtype: Integer
=end
  def pick_index()
    rand = rand(@arr[-1]) + 1 # random number from 1 to max cumulative value (1 because that's the min value w[i] can take)
    @arr.index( @arr.bsearch { |t| t >= rand } )
  end


end

# Your Solution object will be instantiated and called as such:
# obj = Solution.new(w)
# param_1 = obj.pick_index()