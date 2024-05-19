# @param {Integer} x
# @return {Integer}
MAX = 2**31

def reverse(x)
  ans = x.to_s.reverse.to_i
  ans *= -1 if x < 0
  return 0 if ans < -MAX || ans > MAX - 1
  ans
end