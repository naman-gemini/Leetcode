# @param {Integer} n
# @return {Integer}
#
# Recursive solution with memoisation doesn't pass - Stack level too deep for high n
# This is Top Down DP
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
  @dp = Array.new(n) { Array.new(10, nil) }
  count = 0

  (0..9).each do |num|
    count = (count + recurse(n - 1, num) % MOD) % MOD
  end

  count
end

def recurse(hops, num)
  return 1 if hops == 0
  return @dp[hops][num] if @dp[hops][num]
  
  sum = 0
  MAP[num].each do |next_num|
    sum += recurse(hops - 1, next_num)
  end
  @dp[hops][num] = sum
  sum
end

puts knight_dialer(2)
# puts knight_dialer(3000)