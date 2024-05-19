# @param {Integer} n
# @return {Boolean}
def is_happy(n)
  hsh = Hash.new(false)
  hsh[n] = true
  while
    val = n.to_s.chars.map(&:to_i).inject(0) { |sum, n| sum + n * n }
    return true if val == 1
    if hsh[val]
      return false
    else
      hsh[val] = true
      n = val
    end
  end
end