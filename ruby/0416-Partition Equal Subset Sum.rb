# @param {Integer[]} nums
# @return {Boolean}
#
# Recursion: M(i, j) = M(i-1, j) || M(i-1, j - nums[i])
#
# Where M(i, j) is a boolean function which is true if
# there's a subset from 0 to i in nums array which has sum j
#
def can_partition(nums)
  sum = nums.sum
  return false if sum.odd?
  sum = sum / 2 # have to divide array in 2 equal subsets
  dp = Array.new(nums.size + 1) { Array.new (sum + 1) } # Ans would be dp[nums.size][sum]
  (0..nums.size).each { |i| dp[i][0] = true } # 0 sum is possible with empty subset
  (1..sum).each { |j| dp[0][j] = false } # If there is nothing in nums array any positive sum can't be made

  (1..nums.size).each do |i|
    (1..sum).each do |j|
      dp[i][j] = dp[i-1][j] || (dp[i-1][j - nums[i]] rescue false)
    end
  end
  dp[nums.size][sum]
end

puts can_partition([1, 2, 3, 5])