# @param {Integer} x
# @param {Integer} y
# @return {Integer}
def hamming_distance(x, y)
  (x ^ y).to_s(2).count('1')
end