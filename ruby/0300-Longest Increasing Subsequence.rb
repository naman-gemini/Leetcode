# @param {Integer[]} nums
# @return {Integer}
#
# Optimal Substructure:
# Let arr[0..n-1] be the input array and LS(i) be the length of the LIS till index i such that arr[i] is part of LIS
# and arr[i] is the last element in LIS, then LS(i) can be recursively written as.
# LS(i) = { 1 + Max ( LS(j) ) } where j < i and arr[j] < arr[i] and if there is no such j then LS(i) = 1
# To get LIS of a given array, we need to return max(LS(i)) where 0 < i < n

def length_of_lis(nums)
  return 0 if nums.empty?

  dp = []

  0.upto(nums.size - 1).each do |i|
    dp[i] = 1
    0.upto(i).each do |j|
      dp[i] = dp[j] + 1 if nums[i] > nums[j] && dp[j] >= dp[i]
    end
  end

  dp.max
end