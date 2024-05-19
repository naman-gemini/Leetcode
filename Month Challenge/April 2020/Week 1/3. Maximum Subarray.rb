# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
  max_so_far, max_ending_here = 0, 0
  return nums.max if nums.all? { |t| t < 0 }
  nums.each do |num|
    max_ending_here += num
    max_ending_here = 0 if max_ending_here < 0
    max_so_far = max_ending_here if max_ending_here > max_so_far
  end
  max_so_far
end

puts max_sub_array([-1, -2])