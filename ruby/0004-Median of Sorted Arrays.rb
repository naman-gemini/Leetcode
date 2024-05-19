# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
#
# NOTE: Following is the O(n) solution to this problem. Better
# solution is recursively finding median O(log n)
#
def find_median_sorted_arrays(nums1, nums2)
  nums3 = merge_sorted_arrays(nums1, nums2)
  if nums3.size % 2 == 1
    nums3[nums3.size / 2].to_f
  else
    (nums3[nums3.size / 2] + nums3[nums3.size / 2 - 1]) / 2.0
  end
end

def merge_sorted_arrays(arr1, arr2)
  arr = []
  i, j = 0, 0
  while i < arr1.size && j < arr2.size
    if arr1[i] < arr2[j]
      arr << arr1[i]
      i += 1
    else
      arr << arr2[j]
      j += 1
    end
  end
  arr += arr1[i..-1] if i < arr1.size
  arr += arr2[j..-1] if j < arr2.size
  arr
end

puts find_median_sorted_arrays([1, 2], [3])
puts find_median_sorted_arrays([1, 2], [3, 4])