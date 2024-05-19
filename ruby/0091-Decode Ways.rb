# @param {String} s
# @return {Integer}
# Algorithm: Bottom Up 1d DP => O(n)
def num_decodings(s)
  return 0 if s[0] == '0'
  dp = [0] * (s.size + 1)
  dp[0] = 1 #1 way to solve empty string
  1.upto(s.size).each do |i|
    dp[i] += dp[i-1] if s[i-1] != '0'
    dp[i] += dp[i-2] if (10..26).include?(s[(i-2)..(i-1)].to_i)
  end
  dp[s.size]
end

puts num_decodings('1111111')