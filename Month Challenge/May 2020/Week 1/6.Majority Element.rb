# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
  nums.sort[nums.size / 2]
end