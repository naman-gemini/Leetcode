# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def range_bitwise_and(m, n)
  i = 0
  while m != n
    m >>= 1
    n >>= 1
    i += 1
  end
  n << i
end