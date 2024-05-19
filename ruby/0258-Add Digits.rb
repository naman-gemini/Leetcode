# @param {Integer} num
# @return {Integer}
#
# Mathematical formula for digital sum (https://leetcode.com/articles/add-digits/)
#
def add_digits(num)
  return 0 if num == 0
  return 9 if num % 9 == 0
  return num % 9
end