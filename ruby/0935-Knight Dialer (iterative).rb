# @param {Integer} n
# @return {Integer}
#
# Algorithm:
# Bottom Up DP. NOTE: Top Down DP gives TLE as there are too many recursive calls on the stack.
#
# Recursion:
# f(x, k) -> Number of ways to start from x and do k hops
#
# General Case:
# f(0, n) = f(4, n - 1) + f(6, n - 1)
# f(1, n) = f(6, n - 1) + f(8, n - 1)
# .. and so on
#
# Base case:
# f(x, 0) = 1
#
MAP = {
  1 => [6, 8],
  2 => [7, 9],
  3 => [4, 8],
  4 => [0, 3, 9],
  5 => [],
  6 => [0, 1, 7],
  7 => [2, 6],
  8 => [1, 3],
  9 => [2, 4],
  0 => [4, 6]
}

MOD = 10**9 + 7

def knight_dialer(n)
  dp = Array.new(n) { Array.new(10, 0) }
  dp[0] = [1] * 10 # if hops left is 0, ways = 1

  1.upto(n - 1).each do |hops|
    0.upto(9).each do |num|
      MAP[num].each do |next_num|
        dp[hops][num] = (dp[hops][num] + dp[hops - 1][next_num]) % MOD
      end
    end
  end

  dp[n - 1].sum % MOD
end