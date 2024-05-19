# @param {Integer[]} nums
# @return {Integer}
#
# Algorithm: Kadane's Algorithm
#
def max_sub_array(nums)
  global_max, local_max = 0, 0
  return nums.max if nums.all? { |t| t < 0 }

  nums.each do |num|
    local_max = [num, num + local_max].max
    global_max = [global_max, local_max].max
  end
  global_max
end