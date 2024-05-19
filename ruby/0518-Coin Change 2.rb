# @param {Integer} amount
# @param {Integer[]} coins
# @return {Integer}
#
# Algorithm: Dynamic Programming
#
# Recursion:
# f(x, y) = Use x coins (array) to make y
#
# f(x, y) = f(x - 1, y) + f(x, y - coins[i]); Either don't use the last coin or use the last coin
# 
# Base cases:
# f(0, y) = 0 (No ways to create sum y with 0 coins)
# f(x, 0) = 1 (There is 1 way to create sum 0 with x coins => Don't use any coin)
#
def change(amount, coins)
  dp = Array.new(coins.size + 1) { Array.new(amount + 1, 0) }

  0.upto(coins.size).each { |i| dp[i][0] = 1 }

  1.upto(coins.size).each do |i|
    1.upto(amount).each do |j|
      dp[i][j] = dp[i - 1][j] + (j - coins[i - 1] >= 0 ? dp[i][j - coins[i - 1]] : 0)
    end
  end
  dp[coins.size][amount]
end