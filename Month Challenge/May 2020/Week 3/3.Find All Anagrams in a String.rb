# @param {String} s
# @param {String} p
# @return {Integer[]}
def find_anagrams(s, p)
  ans = []
  p_hash = convert(p)

  window = {}
  (0...p.size).each do |i|
    window[s[i]] ||= 0
    window[s[i]] += 1
  end

  ans << 0 if window == p_hash

  i, j = 0, p.size
  while j <= s.size
    # remove i
    if window[s[i]] && window[s[i]] > 1
      window[s[i]] -= 1
    else
      window.delete(s[i])
    end

    # add j
    window[s[j]] ||= 0
    window[s[j]] += 1

    ans << i + 1 if window == p_hash

    i += 1
    j += 1
  end
  ans
end

def convert(p)
  p.chars.each_with_object(Hash.new(0)) { |c, h| h[c] += 1 }
end