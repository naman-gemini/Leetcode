# @param {Integer} n
# @return {Integer}
#
# 1 + 2 + .... x <= n
# x(x + 1) / 2 <= n
# Solve this quadratic equation for x
#
def arrange_coins(n)
  (Math.sqrt(2 * n + 0.25) - 0.5).to_i
end