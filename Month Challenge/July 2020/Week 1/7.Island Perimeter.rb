# @param {Integer[][]} grid
# @return {Integer}
def island_perimeter(grid)
  rows = grid.size
  cols = grid[0].size
  perimeter = 0

  0.upto(rows - 1).each do |row|
    0.upto(cols - 1).each do |col|
      cell = grid[row][col]
      if cell == 1
        # check all 4 directions for water or boundary
        perimeter += 1 if col == 0 || grid[row][col - 1] == 0 # left
        perimeter += 1 if row == 0 || grid[row - 1][col] == 0 # up
        perimeter += 1 if col == cols - 1 || grid[row][col + 1] == 0 # right
        perimeter += 1 if row == rows - 1 || grid[row + 1][col] == 0 # down
      end
    end
  end
  perimeter
end

island_perimeter([[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]])