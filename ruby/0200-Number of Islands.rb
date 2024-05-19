# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
  return 0 if grid.empty?

  @rows = grid.size
  @cols = grid[0].size

  @visited = Array.new(@rows) { Array.new(@cols, false) }
  count = 0

  0.upto(@rows - 1).each do |i|
    0.upto(@cols - 1).each do |j|
      if grid[i][j] == '1' && !@visited[i][j]
        count += 1
        dfs(i, j, grid)
      end
    end
  end
  count
end

def dfs(i, j, grid)
  return if grid[i][j] == '0' # don't want to traverse water
  return if @visited[i][j] #already visited

  @visited[i][j] = true
  dfs(i, j + 1, grid) if j + 1 < @cols # right
  dfs(i + 1, j, grid) if i + 1 < @rows # bottom
  dfs(i, j - 1, grid) if j - 1 >= 0 # left
  dfs(i - 1, j, grid) if i - 1 >= 0 # top
end

# puts num_islands([["1", "1", "1", "1", "0"], ["1", "1", "0", "1", "0"], ["1", "1", "0", "0", "0"], ["0", "0", "0", "0", "0"]])
# puts num_islands([["1", "1", "0", "0", "0"], ["1", "1", "0", "0", "0"], ["0", "0", "1", "0", "0"], ["0", "0", "0", "1", "1"]])
# puts num_islands([['1', '0']])
# puts num_islands([])