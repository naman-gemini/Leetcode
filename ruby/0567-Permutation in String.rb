# @param {String} s1
# @param {String} s2
# @return {Boolean}
def check_inclusion(s1, s2)
  ans = []
  s1_hash = convert(s1)

  window = {}
  (0...s1.size).each do |i|
    window[s2[i]] ||= 0
    window[s2[i]] += 1
  end

  return true if window == s1_hash

  i, j = 0, s1.size
  while j <= s2.size
    # remove i
    if window[s2[i]] && window[s2[i]] > 1
      window[s2[i]] -= 1
    else
      window.delete(s2[i])
    end

    # add j
    window[s2[j]] ||= 0
    window[s2[j]] += 1

    return true if window == s1_hash

    i += 1
    j += 1
  end
  false
end

def convert(str)
  str.chars.each_with_object(Hash.new(0)) { |c, h| h[c] += 1 }
end