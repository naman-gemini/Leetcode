# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent(nums, k)
  nums.inject(Hash.new(0)) { |h, num| h[num] += 1; h }.sort_by { |_,v| v }.last(k).map{ |t| t.first }
end