# @param {Integer[]} nums
# @return {Integer[]}
def single_number(nums)
  hsh = {}
  nums.each do |num|
    hsh[num] ||= 0
    hsh[num] += 1
  end
  hsh.select { |_, v| v == 1}.keys
end