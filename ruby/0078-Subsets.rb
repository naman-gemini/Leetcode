# @param {Integer[]} nums
# @return {Integer[][]}
def subsets(nums)
  @output = []
  recurse(nums.sort, [])
  @output
end

def recurse(nums, curr)
  @output << curr

  left = nums - curr
  return if left.empty?

  left.each do |num|
    recurse(nums, curr + [num]) if (num > curr.last rescue true)
  end
end