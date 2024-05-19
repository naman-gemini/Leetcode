# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
#
# Algorithm: Dutch National Flag problem
#
# Array is divided into 4 sections
# 1) a[0..lo-1] => 0's
# 2) a[lo..mid-1] => 1's
# 3) a[mid..hi] => unknown (to be sorted)
# 4) a[hi+1..n-1] => 2's
#
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