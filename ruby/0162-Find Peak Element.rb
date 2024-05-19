# @param {Integer[]} nums
# @return {Integer}
def find_peak_element(nums)
  binary_search(nums, 0, nums.size - 1)
end

def binary_search(arr, lo, hi)
  return lo if lo == hi
    
  mid = (lo + hi) / 2
  
  if arr[mid] < arr[mid + 1] # there should be a peak on the right
    binary_search(arr, mid + 1, hi)
  else # there should be a peak on the left (including the mid element)
    binary_search(arr, lo, mid)
  end
end