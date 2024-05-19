# @param {Integer[]} nums
# @return {Integer}
def find_min(nums)
  search(nums, 0, nums.size - 1)
end

def search(arr, lo, hi)
  mid = (lo + hi) / 2

  # min element would have following property
  # if mid >= 1 && mid < arr.size - 1 && arr[mid] < arr[mid + 1] && arr[mid] < arr[mid - 1]
    # arr[mid]
  if arr[mid] > arr[hi] # left half is sorted; min should be in right half
    search(arr, mid + 1, hi)
  elsif arr[hi] > arr[mid] # right half is sorted; min should be in left half (including mid)
    search(arr, lo, mid)
  else # both halves are sorted OR mid and hi are the same element
    arr[lo]
  end
end

puts find_min([2,1])