# @param {String} s
# @param {String} p
# @return {Boolean}
#
# Algo - Dynamic Programming. Bottom up.
# Let f(i, j) [boolean] denotes if text of i length matches pattern of j length
#
# f(i, j) = f(i-1, j-1) if text[i] == pattern[j] || pattern[j] == '.'
#         = if pattern[j] == '*'
#         = f(i, j-2) # 0 occurences case
#         = OR
#         = f(i-1, j) if pattern[j-1] == text[i] || pattern[j-1] == '.' 
#         = end
#         = false if anything else
#
# Base Cases:
# f(0, 0) = true ; empty string matches empty pattern
# f(i, 0) = false ; empty pattern doesn't match any string
# f(0, i) = true ; cases like a*b*, .*
#         = false ; otherwise
# => f(0, i) = f(0, i-2) if pattern[i] == '*' ; basically the 0 occurence case
#
# f(m, n) would be the answer ; m - length of text, n - length of pattern
#
def is_match(s, p)
  dp = Array.new(s.size + 1) { Array.new(p.size + 1, false) }
  dp[0][0] = true
  (1..p.size).each do |i|
    dp[0][i] = dp[0][i-2] if p[i-1] == '*'
  end

  (1..s.size).each do |i|
    (1..p.size).each do |j|
      dp[i][j] = 
        if p[j-1] == '*'
          dp[i][j-2] || ( (p[j-2] == s[i-1] || p[j-2] == '.') ? dp[i-1][j] : false )
        else
          (s[i-1] == p[j-1] || p[j-1] == '.') ? dp[i-1][j-1] : false
        end
    end
  end
  # print(dp, s, p)
  dp[s.size][p.size]
end

def print(dp, s, p)
  puts "0: " + p.chars.join(', ')
  puts "0: " + dp[0].join(', ')
  (1..s.size).each do |i|
    puts s[i-1] + ": " + dp[i].join(', ')
  end
end

# puts is_match("aa", "a") # false
# puts is_match("aab", "c*a*b") # true
# puts is_match("mississippi", "mis*is*p*.") # false
# puts is_match("aabb", ".*.*bb") # true
# puts is_match("a", "ab*a") # false
# puts is_match("aaa", "a*a") # true
# puts is_match("a", "ab*") # true
# puts is_match("a", ".*..a*") # false
# puts is_match("ab", ".*..") # true
# puts is_match("aasdfasdfasdfasdfas", "aasdf.*asdf.*asdf.*asdf.*s") # true