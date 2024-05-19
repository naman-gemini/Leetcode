# @param {String} s
# @return {String}
# Algo: Expand around the center
# Complexity: O(n^2)
def longest_palindrome(s)
  return s if s.size == 1
  if s.size == 2
    if s[0] == s[1]
      return s
    else
      return s[0]
    end
  end

  ans = []
  max = 0
  # Minimum string size considered here is 3
  0.upto(s.size - 1).each do |center|
    # center is a character (aba)
    i = center - 1
    j = center + 1
    len = 0
    while i >= 0 && j < s.size && s[i] == s[j]
      len += 1
      i -= 1
      j += 1
    end
    if 2 * len + 1 > max
      max = 2 * len + 1
      ans << s[(i + 1)..(j - 1)] if len > 0
    end

    # center is not a character (abba)
    i = center - 1
    j = center
    len = 0
    while i >= 0 && j < s.size && s[i] == s[j]
      len += 1
      i -= 1
      j += 1
    end
    if 2 * len > max
      max = 2 * len
      ans << s[(i + 1)..(j - 1)] if len > 0
    end
  end
  return s[0] if ans.empty? && s.size > 2
  ans.max_by(&:size).to_s
end

# Algo: Dynamic Programming
# In brute force solution we've O(n^3), the third loop is to check if every substring is 
# palindrome or not. It's unecessary. For ex: if we know aba is palindrome, we can tell xabax is also palindrome
# in O(1) time (by comparing first and last character)
#
# f(i, j) (boolean) = if s[i..j] is a valid palindrome or not
#
# Recursion:
# f(i, j) = f(i + 1, j - 1) if s[i] == s[j] ; j > i and j - i + 1 >= 3 (at-least size 3 substring)
# 
# Base cases:
# f(i, i) = true
# f(i, i + 1) = true if s[i] == s[i + 1] ; size 2 substring
#
# Once we know if s[i..j] is a valid palindrome, we just need to check if it's the biggest one
#
def longest_palindrome_dp(s)
  sz = s.size
  return s if sz == 1

  dp = Array.new(sz) { Array.new(sz, false) }
  ans = ""

  0.upto(sz - 1).each do |i|
    dp[i][i] = true

    if s[i] == s[i + 1]
      dp[i][i + 1] = true
      ans = s[i..(i + 1)]
    end
  end

  (sz - 2).downto(0).each do |i|
    i.upto(sz - 1).each do |j| # j is greater than i
      dp[i][j] = dp[i + 1][j - 1] if s[i] == s[j] && dp[i + 1][j - 1]

      ans = s[i..j] if dp[i][j] && j - i + 1 > ans.size
    end
  end
  ans
end

# puts longest_palindrome_dp("badab")
# puts longest_palindrome_dp("babad")
# puts longest_palindrome_dp("cbbd")
# puts longest_palindrome_dp("aac")
# puts longest_palindrome_dp("babadada")
# puts longest_palindrome_dp("ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg")
# puts longest_palindrome_dp("jglknendplocymmvwtoxvebkekzfdhykknufqdkntnqvgfbahsljkobhbxkvyictzkqjqydczuxjkgecdyhixdttxfqmgksrkyvopwprsgoszftuhawflzjyuyrujrxluhzjvbflxgcovilthvuihzttzithnsqbdxtafxrfrblulsakrahulwthhbjcslceewxfxtavljpimaqqlcbrdgtgjryjytgxljxtravwdlnrrauxplempnbfeusgtqzjtzshwieutxdytlrrqvyemlyzolhbkzhyfyttevqnfvmpqjngcnazmaagwihxrhmcibyfkccyrqwnzlzqeuenhwlzhbxqxerfifzncimwqsfatudjihtumrtjtggzleovihifxufvwqeimbxvzlxwcsknksogsbwwdlwulnetdysvsfkonggeedtshxqkgbhoscjgpiel")