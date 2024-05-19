# @param {String} text1
# @param {String} text2
# @return {Integer}
#
## f(i, j) = LCS of a[0..(i-1)] and b[0..(j-1)]

# f(i, j) = f(i - 1, j - 1) + 1 if a[i-1] == b[j-1]
#         = MAX(f(i - 1, j), f(i, j - 1)) if a[i-1] != b[j-1]
#
# Base Cases:
# f(0, j) = 0
# f(i, 0) = 0
#
# Ans: f(a.size, b.size)
#
# @param {Integer[]} a
# @param {Integer[]} b
# @return {Integer}
def max_uncrossed_lines(a, b)
  dp = Array.new(a.size + 1) { Array.new(b.size + 1, 0) }

  1.upto(a.size).each do |i|
    1.upto(b.size).each do |j|
      if a[i-1] == b[j-1]
        dp[i][j] = dp[i-1][j-1] + 1
      else
        dp[i][j] = [dp[i-1][j], dp[i][j-1]].max
      end
    end
  end

  dp[a.size][b.size]
end