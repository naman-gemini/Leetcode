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
def longest_common_subsequence(text1, text2)
  dp = Array.new(text1.size + 1) { Array.new(text2.size + 1, 0) }

  1.upto(text1.size).each do |i|
    1.upto(text2.size).each do |j|
      dp[i][j] = 
        if text1[i - 1] == text2[j - 1]
          dp[i - 1][j - 1] + 1
        else
          [dp[i - 1][j], dp[i][j - 1]].max
        end
    end
  end

  dp[text1.size][text2.size]
end