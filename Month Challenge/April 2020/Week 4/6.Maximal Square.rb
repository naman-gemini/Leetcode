# @param {Character[][]} matrix
# @return {Integer}
def maximal_square(matrix)
  return 0 if matrix.empty?

  rows = matrix.size
  cols = matrix[0].size

  max_len = 0

  dp = Array.new(rows + 1) { Array.new(cols + 1, 0) }

  0.upto(rows - 1).each do |i|
    0.upto(cols - 1).each do |j|
      if matrix[i][j] == '1'
        dp[i][j] = [(dp[i-1][j] rescue 0), (dp[i][j-1] rescue 0), (dp[i-1][j-1] rescue 0)].min + 1
        max_len = dp[i][j] if dp[i][j] > max_len
      end
    end
  end

  max_len * max_len
end