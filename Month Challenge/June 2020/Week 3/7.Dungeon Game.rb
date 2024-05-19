# @param {Integer[][]} dungeon
# @return {Integer}
#
# Algorithm: Dynamic Programming (Bottom Up)
# Recursion:
# f(x, y) = 1 ; if matrix[x][y] > min(f(x + 1, y), f(x, y + 1))
# f(x, y) = min(f(x + 1, y), f(x, y + 1)) - matrix[x][y] ; otherwise
# 
# Combining above 2:
# f(x, y) = max(min(f(x + 1, y), f(x, y + 1)) - matrix[x][y], 1)
#
# f(0, 0) is the answer
#
INF = 1.0/0

def calculate_minimum_hp(dungeon)
  rows = dungeon.size
  cols = dungeon[0].size
  dp = Array.new(rows) { Array.new(cols, 1) }
  (rows - 1).downto(0).each do |row|
    (cols - 1).downto(0).each do |col|
      if row == rows - 1 && col == cols - 1
        dp[row][col] = [1 - dungeon[row][col], 1].max
        next
      end
      dp[row][col] = [[(row + 1 < rows ? dp[row + 1][col] : INF),
                    (col + 1 < cols ? dp[row][col + 1] : INF)].min - dungeon[row][col], 1].max
    end
  end
  dp[0][0]
end