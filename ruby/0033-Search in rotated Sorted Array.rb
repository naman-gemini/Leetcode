# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  rotated_search(nums, 0, nums.size - 1, target)
end

def rotated_search(nums, lo, hi, target)
  mid = (lo + hi) / 2

  return -1 if lo > hi

  if nums[mid] == target
    return mid
  elsif nums[lo] <= nums[mid] # first half is sorted
    if target >= nums[lo] && target < nums[mid]
      rotated_search(nums, lo, mid - 1, target) # search in sorted half
    else
      rotated_search(nums, mid + 1, hi, target) # search in non sorted half (but still dividing the problem in half)
    end
  else # second half is sorted
    if target > nums[mid] && target <= nums[hi]
      rotated_search(nums, mid + 1, hi, target)
    else
      rotated_search(nums, lo, mid - 1, target)
    end
  end
end