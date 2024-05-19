# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
# Algorithm: Dutch National Flag problem
def sort_colors(nums)
  lo, mid, hi = 0, 0, nums.size - 1
  while mid <= hi
    if nums[mid] == 0
      nums[mid], nums[lo] = nums[lo], nums[mid]
      lo += 1
      mid += 1
    elsif nums[mid] == 1
      mid += 1
    else # 2
      nums[mid], nums[hi] = nums[hi], nums[mid]
      hi -= 1
    end
  end
end