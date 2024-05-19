# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
#
# Quickselect Algorithm: O(n) (Average time)
#
def find_kth_largest(nums, k)
  # kth largest number is (n - k + 1)th smallest number
  find_kth_smallest(nums, nums.size - k + 1)
end

def find_kth_smallest(nums, k)
  quick_select(nums, 0, nums.size - 1, k - 1) # kth smallest number would be at (k - 1)th index
end

# Returns the element that should be on kth index of the sorted arr[left..right]
def quick_select(arr, left, right, k)
  pos = partition(arr, left, right)

  if pos > k
    quick_select(arr, left, pos - 1, k) # kth smallest is in left partition
  elsif pos < k
    quick_select(arr, pos + 1, right, k) # kth smallest is in right partition
  else
    arr[pos]
  end
end

# NOTE: Modifications to the arr is in place
def partition(arr, left, right)
  pivot_index = left
  pivot = arr[pivot_index]

  while left < right
    left += 1 while arr[left] && arr[left] <= pivot
    right -= 1 while arr[right] && arr[right] > pivot
    arr[left], arr[right] = arr[right], arr[left] if left < right
  end
  # right is final position for pivot
  arr[pivot_index], arr[right] = arr[right], arr[pivot_index]

  right # this is basically the new pivot_index
end