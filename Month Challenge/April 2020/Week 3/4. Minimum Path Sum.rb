# @param {Integer[][]} grid
# @return {Integer}
def min_path_sum(grid)
  rows = grid.size
  cols = grid[0].size

  dp = Array.new(rows) { Array.new(cols, 0) }

  dp[0][0] = grid[0][0]

  1.upto(rows - 1).each { |i| dp[i][0] = dp[i-1][0] + grid[i][0] }
  1.upto(cols - 1).each { |j| dp[0][j] = dp[0][j-1] + grid[0][j] }

  1.upto(rows - 1).each do |i|
    1.upto(cols - 1).each do |j|
      dp[i][j] = [dp[i-1][j], dp[i][j-1]].min + grid[i][j]
    end
  end
  dp[rows - 1][cols - 1]
end