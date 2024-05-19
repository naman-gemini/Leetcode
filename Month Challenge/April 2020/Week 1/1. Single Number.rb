# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
  nums.inject(0) { |xor, num| xor ^ num }
end