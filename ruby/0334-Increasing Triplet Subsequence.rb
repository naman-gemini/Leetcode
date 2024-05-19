# @param {Integer[]} nums
# @return {Boolean}
def increasing_triplet(nums)
  low = mid = Float::INFINITY
  
  for num in nums
    if num <= low
      low = num # 1st number
    elsif num <= mid
      mid = num # 2nd number
    else
      return true # 3rd number
    end
  end

  false
end