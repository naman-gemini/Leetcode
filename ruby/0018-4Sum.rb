# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[][]}
def four_sum(nums, target)
  ans = []
  nums.sort!
  # i < j < k < l
  0.upto(nums.size - 4).each do |i|
    next if i > 0 && nums[i] == nums[i-1] # avoid duplicates
    (i+1).upto(nums.size - 3).each do |j|
      next if j > i + 1 && nums[j] == nums[j-1] # avoid duplicates

      k = j + 1
      l = nums.size - 1

      while k < l
        sum = nums[i] + nums[j] + nums[k] + nums[l]
        if sum < target
          k += 1
        elsif sum > target
          l -= 1
        else
          ans << [ nums[i], nums[j], nums[k], nums[l] ]
          k += 1
          l -= 1
          k += 1 while nums[k-1] == nums[k]
          l -=1 while nums[l] == nums[l+1]
        end
      end
    end
  end
  ans.uniq
end

four_sum([-5, -4, -3, -2, 1, 3, 3, 5], -11)