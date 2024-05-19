# @param {Integer[]} nums
# @return {Boolean}
#
# In a bottom up fashion fill the dp array
# dp[i] (boolean) denotes if it's possible to reach ith index or not
#
def can_jump_dp(nums)
  dp = [false] * nums.size
  dp[0] = true # it's always possible to reach 0th index
  nums.each_with_index do |num, i|
    next unless dp[i] # start jumping from i only if it's possible to reach ith index
    return true if i + num >= nums.size - 1 # we can reach last index
    (1..num).each do |jump|
      next if i + jump >= nums.size
      dp[i+jump] = true
    end
  end
  dp[nums.size - 1]
end

# the dp solution is good for understanding, but it's O(n^2) and will give TLE.
# there's a O(n) greedy solution to this as well
#
# Just iterate and update the maximal index that we can reach

def can_jump(nums)
  i, reach = 0, 0
  0.upto(nums.size - 2).each do |i|
    break if i > reach # we can't reach this index
    reach = [reach, i + nums[i]].max
  end
  reach >= nums.size - 1
end

puts can_jump([3,2,2,0,4])