# @param {Integer[]} nums
# @param {Integer} val
# @return {Integer}
def remove_element(nums, val)
  i = 0
  nums.each do |num|
    if num != val
      nums[i] = num
      i += 1
    end
  end
  i
end