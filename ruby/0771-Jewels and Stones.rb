# @param {String} j
# @param {String} s
# @return {Integer}
def num_jewels_in_stones(j, s)
  hsh, count = {}, 0
  j.each_char { |char| hsh[char] = true }
  s.each_char { |char| count += 1 if hsh[char] }
  count
end