# @param {Integer[]} nums
# @return {Integer}
# 
# Algorithm: Dynamic Programming
# 
# Now because we're in a circle and we already have solved problem for a line
# We can break this problem in 2 parts, to handle the circlular case
# Considering 1) 0 to n-2 houses (not including last) 2) 1 to n-1 houses (not including first) and take max of 2
#
def rob(nums)
  n = nums.size
  return nums[0] if n == 1
  
  [ helper(nums[0..(n - 2)]), helper(nums[1..(n - 1)]) ].max
end

def helper(nums)
  # puts "nums = #{nums.join(',')}"
  n = nums.size - 1
  dp = [0] * n
  dp[0] = nums[0]
  dp[1] = nums[0..1].max
  2.upto(n).each do |i|
    dp[i] = [dp[i-2] + nums[i], dp[i-1]].max
  end
  dp[n]
end

# puts rob([1,2,3])