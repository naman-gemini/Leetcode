# @param {Integer[][]} grid
# @return {Integer}
def cherry_pickup(grid)
  @rows = grid.size
  @cols = grid[0].size

  @visited = Array.new(@rows) { Array.new(@cols, false) }
  cherries = 0
  cherries = dfs_bottom_right(0, 0, grid.dup, cherries)
  puts "reached here!!"
  puts "cherries = #{cherries}"

  @visited = Array.new(@rows) { Array.new(@cols, false) } # reset visited array now
  cherries = dfs_top_left(@rows - 1, @cols - 1, grid.dup, cherries)

  cherries
end

def dfs_bottom_right(i, j, grid, cherries)
  return if grid[i][j] == -1 # don't want to traverse thorns
  return if @visited[i][j] #already visited
  return cherries if i == @rows - 1 && j == @cols - 1 # bottom right reached

  puts grid.map{|t| t.join(',')}

  @visited[i][j] = true
  if grid[i][j] == 1
  	cherries += 1
  	grid[i][j] = 0
  end

  puts "i = #{i}, j = #{j}, cherries = #{cherries}"

  dfs_bottom_right(i, j + 1, grid.dup, cherries) if j + 1 < @cols # right
  dfs_bottom_right(i + 1, j, grid.dup, cherries) if i + 1 < @rows # bottom
end

def dfs_top_left(i, j, grid, cherries)
  return if grid[i][j] == -1 # don't want to traverse thorns
  return if @visited[i][j] #already visited
  return cherries if i == 0 && j == 0 # top left reached

  @visited[i][j] = true
  if grid[i][j] == 1
  	cherries += 1
  	grid[i][j] = 0
  end

  dfs_top_left(i, j - 1, grid.dup, cherries) if j - 1 >= 0 # left
  dfs_top_left(i - 1, j, grid.dup, cherries) if i - 1 >= 0 # top
end

puts cherry_pickup([[0,1,-1],[1,0,-1],[1,1,1]])