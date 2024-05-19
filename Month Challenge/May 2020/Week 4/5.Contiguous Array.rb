# @param {Integer[]} nums
# @return {Integer}
#
# Algo: if we encounter the same count twice while traversing the array, 
# it means that the number of zeros and ones are equal between the indices corresponding 
# to the equal countcount values
#
def find_max_length(nums)
  map, count, maxlen = {0 => -1}, 0, 0
  nums.each_with_index do |num, i|
    count += 1 if num == 1
    count -= 1 if num == 0
    if map[count]
      maxlen = [maxlen, i - map[count]].max
    else
      map[count] = i
    end
  end
  maxlen
end