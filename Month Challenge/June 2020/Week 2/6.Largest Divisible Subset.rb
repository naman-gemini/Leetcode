# @param {Integer[]} nums
# @return {Integer[]}
def largest_divisible_subset(nums)
  return [] if nums.empty?
  nums.sort! # we now know nums[i] is greater than nums[0] to nums[i - 1]
  div_count = [1] * nums.size # number of divisors of nums[i] from index 0 to i - 1
  max_index = 0
  prev = [-1] * nums.size

  0.upto(nums.size - 1).each do |i|
    0.upto(i - 1).each do |j|
      # nums[i] is greater than nums[j]
      if nums[i] % nums[j] == 0
        # only consider j if it increases div_count of i the maximum
        if div_count[i] <= div_count[j]
          div_count[i] = div_count[j] + 1
          prev[i] = j
        end
      end
      # mark largest subset
      max_index = i if div_count[i] > div_count[max_index]
    end
  end

  subset = []
  i = max_index
  # create largest subset from above info
  while i >= 0
    subset << nums[i]
    i = prev[i]
  end
  subset.reverse
end

puts largest_divisible_subset([4,8,10,240]).join(',')