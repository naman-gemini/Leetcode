# @param {Integer[]} nums
# @return {Integer}
# 
# Algorithm: Dynamic Programming
#
# Recursion:
# f(x) = max money robbed till xth house
# f(x) -> 2 options (either rob x house or don't rob x house) -> take max of these
# f(x) = max of { f(x-2) + money in xth house, f(x-1) }
#
def rob(nums)
  n = nums.size - 1
  dp = [0] * n
  dp[0] = nums[0]
  dp[1] = nums[0..1].max
  2.upto(n).each do |i|
  	dp[i] = [dp[i-2] + nums[i], dp[i-1]].max
  end
  dp[n]
end

# puts rob([2,7,9,3,1])