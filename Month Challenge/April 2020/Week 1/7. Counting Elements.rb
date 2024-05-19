# @param {Integer[]} arr
# @return {Integer}
def count_elements(arr)
  hsh = Hash.new(false)
  arr.each { |num| hsh[num] = true }
  ans = 0
  arr.each do |num|
    ans += 1 if hsh[num + 1]
  end
  ans
end

puts count_elements([1,1,2,2])