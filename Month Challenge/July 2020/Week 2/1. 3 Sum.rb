# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  ans = []
  nums = nums.sort
  # i < j < k
  0.upto(nums.size - 3).each do |i|
    j = i + 1
    k = nums.size - 1
    while j < k
      sum = nums[i] + nums[j] + nums[k]
      if sum < 0
        j += 1
      elsif sum > 0
        k -= 1
      else
        ans << [nums[i], nums[j], nums[k]]
        j += 1
        k -= 1
        j += 1 while nums[j-1] == nums[j] # keep incrementing to get rid of duplicates
        k -= 1 while nums[k] == nums[k+1]
      end
    end
  end
  ans.uniq
end

three_sum([-1, 0, 1, 2, -1, -4])