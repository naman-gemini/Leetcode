# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums)
  @ans = []
  recurse(nums, [])
  @ans
end

def recurse(nums, curr)
  left = nums - curr

  if left.empty?
    @ans << curr
    return
  end

  left.each do |num|
    recurse(nums, curr + [num])
  end
end