# @param {Integer[]} coins
# @param {Integer} amount
# @return {Integer}
#
# Algorithm: Dynamic Programming
# Pick the solution which has least number of coins
#
# Recursion: (Minimum coins required to generate sum i)
# M(i) = Min(M(i - coins[j]) + 1; where j varies from 0 to n - 1
#
# Base cases:
# M(0) = 0 ; No coins required for 0 sum
# M(i) = -1 ; When n = 0 (no coins available)
#
INF = 1.0/0

def coin_change(coins, amount)
  dp = [INF] * (amount + 1)
  dp[0] = 0
  (1..amount).each do |i|
    0.upto(coins.size - 1).each do |j|
      dp[i] = [dp[i], dp[i - coins[j]]].min if i - coins[j] >= 0
    end
    dp[i] += 1
  end
  dp[amount] == INF ? -1 : dp[amount]
end

puts coin_change([2], 11)