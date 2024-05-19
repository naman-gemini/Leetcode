# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
  return 1 if nums.size == 1

  i, j = 0, 1
  count = 0
  while i < nums.size
    if nums[i] == nums[j]
      break if j >= nums.size
      while nums[i] == nums[j]
        j += 1
      end
      count += 1
      i += 1
      nums[i] = nums[j]
    else
      i += 1
      j += 1
      count += 1
    end
  end
  # puts nums[0..count].join(',')
  count
end

puts remove_duplicates([1,2,3])
puts remove_duplicates([1,1,2])
puts remove_duplicates([0,0,1,1,1,2,2,3,3,4])