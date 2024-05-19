# @param {Integer[]} a
# @return {Integer}
# Modifying kadane's algorithm a bit
# Very nice explanation: https://www.youtube.com/watch?v=os4B7MlHAbs
def max_subarray_sum_circular(a)
  # Case 1: Subarray is in middle of the array

  # Case 2: Subarray is including cyclic array
  # This subarray stretches left and right from end of the array
  # So basically, such max subarray would be total sum of array - min subarray sum
  # min subarray sum can be found in similar fashion as above

  # Case 3: All elements are negative

  total_sum = local_max = local_min = 0
  global_max = global_min = a.first

  a.each do |num|
    total_sum += num
    local_max = [num, num + local_max].max
    global_max = [global_max, local_max].max
    local_min = [num, num + local_min].min
    global_min = [global_min, local_min].min
  end

  if global_max > 0
    [global_max, total_sum - global_min].max
  else
    # case 3
    a.max
  end
end