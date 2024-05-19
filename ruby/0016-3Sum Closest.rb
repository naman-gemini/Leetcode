# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def three_sum_closest(nums, target)
  nums = nums.sort
  min_diff = 1_000_000
  ans = 0
  # i < j < k
  0.upto(nums.size - 3).each do |i|
    j = i + 1
    k = nums.size - 1
    while j < k
      sum = nums[i] + nums[j] + nums[k]
      # puts "sum = #{sum}"
      diff = (target - sum).abs
      # puts "diff = #{diff}"
      if diff < min_diff
        min_diff = diff
        ans = sum
      end
      if sum < target
        j += 1
      elsif sum > target
        k -= 1
      else
        return ans
      end
    end
  end
  ans
end

puts three_sum_closest([1,1,1,0], -100)