# @param {String} str
# @return {Integer}
INT_MIN = -2**31
INT_MAX = 2**31 - 1

def my_atoi(str)
  num = str.to_i
  return INT_MIN if num < INT_MIN
  return INT_MAX if num > INT_MAX
  num
end