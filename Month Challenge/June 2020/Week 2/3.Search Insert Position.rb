# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_insert(nums, target)
  return nums.size if target > nums.last
  nums.index(nums.bsearch { |t| t >= target })
end