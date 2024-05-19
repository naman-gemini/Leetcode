# @param {String} s
# @param {String} t
# @return {Boolean}
def is_subsequence(s, t)
  return true if s.size == 0

  j = 0
  0.upto(t.size - 1).each do |i|
    j += 1 if t[i] == s[j]
    return true if j == s.size
  end
  false
end