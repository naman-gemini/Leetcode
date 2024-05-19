# @param {Integer} n, a positive integer
# @return {Integer}
def reverse_bits(n)
  str = n.to_s(2)
  str = '0' * (32 - str.size) + str
  str = str.reverse
  str.to_i(2)
end