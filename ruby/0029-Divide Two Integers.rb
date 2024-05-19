# @param {Integer} dividend
# @param {Integer} divisor
# @return {Integer}
MAX = 2**31
def divide(dividend, divisor)

  ans = dividend.abs / divisor.abs
  ans = dividend * divisor < 0 ? -ans : ans
  if ans > MAX - 1 || ans < -MAX
    MAX - 1
  else
    ans
  end
end

puts divide(10,3)