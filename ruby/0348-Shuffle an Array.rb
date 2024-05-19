class Solution

=begin
  :type nums: Integer[]
=end
  def initialize(nums)
    @orig = nums
  end

=begin
    Resets the array to its original configuration and return it.
    :rtype: Integer[]
=end
  def reset()
    @orig
  end


=begin
    Returns a random shuffling of the array.
    :rtype: Integer[]
=end
  def shuffle()
    arr = @orig.dup
    (arr.size - 1).downto(0).each do |i|
      j = rand(i + 1)
      arr[i], arr[j] = arr[j], arr[i]
    end
    arr
  end

end

# Your Solution object will be instantiated and called as such:
# obj = Solution.new(nums)
# param_1 = obj.reset()
# param_2 = obj.shuffle()