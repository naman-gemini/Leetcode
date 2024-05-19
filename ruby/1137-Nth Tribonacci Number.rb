# @param {Integer} n
# @return {Integer}
def tribonacci(n)
  dp = [0] * 40
  dp[1] = 1
  dp[2] = 1
  3.upto(n).each do |i|
  	dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
  end
  dp[n]
end