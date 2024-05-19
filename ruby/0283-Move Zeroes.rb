# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
  # i points to the first zero element in the array
  # j points to the first non zero element in the array after i
  i, j = 0, 0
  while j < nums.size && i < nums.size
    i += 1 while nums[i] != 0 && i < nums.size
    j += 1 while (nums[j] == 0 || j <= i) && j < nums.size
    if nums[i] && nums[j] && i < j
      nums[i], nums[j] = nums[j], nums[i] # swap nums[i] and nums[j]
      i += 1
      j += 1
    end
  end
  puts nums.join(',')
end

# move_zeroes([0,1,0,3,12])