# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
#
# 1 pass
def two_sum(nums, target)
  map = {}
  nums.each_with_index do |num, index|
    return [map[target-num], index] if (map[target-num])
    map[num] = index
  end
end

# Alternative (2 passes)
def two_sum(nums, target)
  hash = {}
  nums.each_with_index do |n, i|
    hash[n] = i
  end
  nums.each_with_index do |n, i|
    return [i, hash[target-n]] if hash[target - n] && hash[target - n] != i
  end
end