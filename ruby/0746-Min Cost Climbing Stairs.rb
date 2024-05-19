# @param {Integer[]} cost
# @return {Integer}
# 
# Algorithm: Dynamic Programming
#
# Recursion:
# f(x) = min cost to reach xth level
# f(x) = min of { f(x-1) + cost[x-1], f(x-2) + cost[x-2] }
#
def min_cost_climbing_stairs(cost)
	n = cost.size # top floor
  dp = [0] * n
  2.upto(n).each do |i|
  	dp[i] = [dp[i-1] + cost[i-1], dp[i-2] + cost[i-2]].min
  end
  dp[n]
end

# puts min_cost_climbing_stairs([1,100,1,1,1,100,1,1,100,1])