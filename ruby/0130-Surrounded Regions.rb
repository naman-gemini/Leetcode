# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
#
# Algorithm:
#
# iterate to a O
# use dfs on it (in all 4 directions). if you find a any cell on boundary return false, else return true
# if dfs of current cell is true, then use a second dfs to mark all cells as X
# repeat
#
def solve(board)
  return [] if board.empty?
  
  @board = board
  @rows = board.size
  @cols = board[0].size

  0.upto(@rows - 1).each do |row|
    0.upto(@cols - 1).each do |col|
      if board[row][col] == 'O'
        visited = Array.new(@rows) { Array.new(@cols, false) }
        if dfs(row, col, visited)
          visited_x = Array.new(@rows) { Array.new(@cols, false) }
          mark_x(row, col, visited_x)
        end
      end
    end
  end
end

def mark_x(row, col, visited)
  return if visited[row][col]

  visited[row][col] = true
  @board[row][col] = 'X'

  mark_x(row - 1, col, visited) if row - 1 >= 0 && @board[row - 1][col] == 'O' # up
  mark_x(row + 1, col, visited) if row + 1 < @rows && @board[row + 1][col] == 'O' # down
  mark_x(row, col - 1, visited) if col - 1 >= 0 && @board[row][col - 1] == 'O' # left
  mark_x(row, col + 1, visited) if col + 1 < @cols && @board[row][col + 1] == 'O' # right
end

def dfs(row, col, visited)
  return true if visited[row][col]

  visited[row][col] = true
  return true if @board[row][col] == 'X' || row < 0 || col < 0 || row >= @rows || col >= @cols
  return false if boundary_cell?(row, col)

  # This cell is not boundary cell. Now, let's check rest of the adjacent cells.
  dfs(row - 1, col, visited) && dfs(row + 1, col, visited) && dfs(row, col - 1, visited) && dfs(row, col + 1, visited) 
end

def boundary_cell?(row, col)
  row == 0 || row == @rows - 1 || col == 0 || col == @cols - 1
end