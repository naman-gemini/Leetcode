# @param {String} s
# @param {String[]} words
# @return {Integer[]}
def find_substring(s, words)
  ans = []
  return ans if words.empty?
  words.permutation.to_a.each do |p|
    word = p.join('')
    if s.include?(word)
      ans << (0...s.size).find_all { |i| s[i, word.size] == word }
    end
  end
  ans.flatten.uniq
end

puts find_substring("wordgoodgoodgoodbestword", ["word","good","best","word"])

puts find_substring("foobarfoobar", ["foo","bar"])