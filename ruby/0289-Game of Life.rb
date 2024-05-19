# @param {Integer[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def game_of_life(board)
  copy = Marshal.load(Marshal.dump(board))

  @rows = board.size
  @cols = board[0].size

  0.upto(@rows - 1).each do |i|
    0.upto(@cols - 1).each do |j|
      live_neighbors = live_neighbor_count(copy, i, j)

      if copy[i][j] == 1
        # rule 1
        board[i][j] = 0 if live_neighbors < 2

        # rule 2
        # need no change

        # rule 3
        board[i][j] = 0 if live_neighbors > 3
      else
        board[i][j] = 1 if live_neighbors == 3
      end
    end
  end
end

def live_neighbor_count(board, row, col)
  count = 0

  # top left
  count += 1 if row - 1 >= 0 && col - 1 >= 0 && board[row - 1][col - 1] == 1
  # top
  count += 1 if row - 1 >= 0 && board[row - 1][col] == 1
  # top right
  count += 1 if row - 1 >= 0 && col + 1 < @cols  && board[row - 1][col + 1] == 1
  # right
  count += 1 if col + 1 < @cols && board[row][col + 1] == 1
  # bottom right
  count += 1 if row + 1 < @rows && col + 1 < @cols && board[row + 1][col + 1] == 1
  # bottom
  count += 1 if row + 1 < @rows && board[row + 1][col] == 1
  # bottom left
  count += 1 if row + 1 < @rows && col - 1 >= 0 && board[row + 1][col - 1] == 1
  # left
  count += 1 if col - 1 >= 0 && board[row][col - 1] == 1

  count
end