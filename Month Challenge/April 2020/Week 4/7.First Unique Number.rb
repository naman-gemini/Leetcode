class FirstUnique

=begin
    :type nums: Integer[]
=end
  def initialize(nums)
    @hash = nums.each_with_object({}) do |num, h|
      if h.key?(num)
        h[num] = false
      else
        h[num] = true
      end
    end
  end


=begin
    :rtype: Integer
=end
  def show_first_unique()
    @hash.each do |k, v|
      return k if v
    end
    return -1
  end


=begin
    :type value: Integer
    :rtype: Void
=end
  def add(value)
    if @hash.key?(value)
      @hash[value] = false
    else
      @hash[value] = true
    end
  end


end

# Your FirstUnique object will be instantiated and called as such:
# obj = FirstUnique.new(nums)
# param_1 = obj.show_first_unique()
# obj.add(value)