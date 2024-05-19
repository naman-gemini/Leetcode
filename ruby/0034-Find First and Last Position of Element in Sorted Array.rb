# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target)
  [lower_bound(nums, target, 0, nums.size - 1), upper_bound(nums, target, 0, nums.size - 1)]
end

def lower_bound(nums, target, lo, hi)
  return -1 if lo > hi

  mid = (lo + hi) / 2
  if ( lo == mid && nums[mid] == target ) || ( nums[mid] == target && nums[mid - 1] < target )
    return mid
  elsif nums[mid] < target # search in right half
    lower_bound(nums, target, mid + 1, hi)
  else # equality goes to left half
    lower_bound(nums, target, lo, mid - 1)
  end
end

def upper_bound(nums, target, lo, hi)
  return -1 if lo > hi

  mid = (lo + hi) / 2
  if ( mid == hi && nums[mid] == target ) || ( nums[mid] == target && nums[mid + 1] > target )
    return mid
  elsif nums[mid] > target # search in left half
    upper_bound(nums, target, lo, mid - 1)
  else # equality goes to right half
    upper_bound(nums, target, mid + 1, hi)
  end
end