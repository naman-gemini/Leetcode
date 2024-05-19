# @param {String} word1
# @param {String} word2
# @return {Integer}
#
# Algorithm: Dynamic Programming
# Recursion:
# Let f(m, n) denote number of operations required to convert X(m) to Y(n) (X and Y are strings with m and n chars)
#
# f(m, n) = f(m - 1, n - 1) if X[m - 1] == Y[n - 1] # Last character is already equal, that reduces the problem
# else
# f(m, n) = 1 + min of the three operations:
#         = f(m - 1, n - 1) # Substituted last character of X with last character of Y
#         = f(m - 1, n)     # Deleted last character of X
#         = f(m, n - 1)     # Inserted last character of Y in end of X (now they have same last char)
#
# Base Cases:
# f(0, 0) = 0 # No operations required to convert empty string to empty string
# f(0, j) = j # It'll take j insertions to convert empty string to string of size j
# f(i, 0) = i # It'll take i deletions to convert string of i size to empty string
#
def min_distance(word1, word2)
  dp = Array.new(word1.size + 1) { Array.new(word2.size + 1, 0) }

  # Base cases
  1.upto(word1.size).each { |i| dp[i][0] = i }
  1.upto(word2.size).each { |j| dp[0][j] = j }

  # General case (Bottom up DP)
  1.upto(word1.size).each do |i|
    1.upto(word2.size).each do |j|
      if word1[i - 1] == word2[j - 1]
        dp[i][j] = dp[i - 1][j - 1]
      else
        dp[i][j] = 1 + [dp[i - 1][j - 1], dp[i - 1][j], dp[i][j - 1]].min
      end
    end
  end

  dp[word1.size][word2.size]
end

puts min_distance("horse", "ros")