# @param {Integer} n
# @return {Boolean}
def is_power_of_two(n)
  while n > 1
    return true if n == 1
    return false if n % 2 == 1
    n >>= 1
  end
  false
end