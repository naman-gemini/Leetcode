# @param {Integer} num
# @return {Integer}
def bitwise_complement(num)
  num.to_s(2).chars.map { |c| c == '1' ? '0' : 1 }.join.to_i(2)
end