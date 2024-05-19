# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
#
# Very non inuitive O(n) solution. Just remember such approach for such questions.
#
def subarray_sum(nums, k)
  hsh = Hash.new(0)
  hsh[0] = 1

  count = sum = 0

  nums.each do |num|
    sum += num
    count += hsh[sum - k] if hsh[sum - k] > 0
    hsh[sum] += 1
  end
  count
end