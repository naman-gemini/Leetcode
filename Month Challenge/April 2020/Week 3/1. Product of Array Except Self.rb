# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
  left, right, output = [], [], []

  0.upto(nums.size - 1).each do |i|
    left[i] = (i-1 >= 0 ? left[i-1] : 1) * (i-1 >= 0 ? nums[i-1] : 1)
  end

  (nums.size - 1).downto(0).each do |i|
    right[i] = (right[i+1] ? right[i+1] : 1) * (nums[i+1] ? nums[i+1] : 1)
  end

  0.upto(nums.size - 1).each do |i|
    output[i] = left[i] * right[i]
  end
  
  output
end