# @param {Integer[]} nums
# @return {Integer}
def find_min(nums)
  search(nums, 0, nums.size - 1)
end

def search(arr, lo, hi)
  return arr[lo] if arr[lo] < arr[hi] # increasing array (no dip)
  return arr[lo] if lo == hi # just 1 element in array

  mid = (lo + hi) / 2

  # first min element would have following property
  # if mid >= 1 && mid < arr.size - 1 && arr[mid] <= arr[mid + 1] && arr[mid] < arr[mid - 1]
  #   arr[mid]
  if arr[mid] > arr[hi] # left half is sorted; min should be in right half
    search(arr, mid + 1, hi)
  elsif arr[mid] < arr[hi] # right half is sorted;  min should be in left half (including mid)
    search(arr, lo, mid)
  else # case when arr[mid] == arr[hi]
    search(arr, lo, hi - 1) # min can be on any side, we have to go by linear search only
  end
end