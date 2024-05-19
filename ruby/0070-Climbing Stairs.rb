# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
	dp = [0] * n
	dp[1] = 1
	dp[2] = 2
	3.upto(n).each do |i|
		dp[i] = dp[i-1] + dp[i-2]
	end
	dp[n]
end