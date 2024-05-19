# @param {Character[][]} matrix
# @return {Integer}
# Complexity: O(n^3)
def maximal_square_brute_force(matrix)
  return 0 if matrix.empty?

  rows = matrix.size
  cols = matrix[0].size

  max_len = 0

  # consider all possible starting points of top left corner
  0.upto(rows - 1).each do |i|
    0.upto(cols - 1).each do |j|
      next if matrix[i][j] == '0'

      flag = true
      len = 1

      while i + len < rows && j + len < cols && flag
        # NOTE: We've already checked i to (i + len - 1)th row and j to (j + len - 1)th col
        # Basically, in every iteration of a value of len we have to just check 1 row and 1 col
        
        # check j to (j + len)th col on (i + len)th row
        j.upto(j + len).each do |k|
          if matrix[i + len][k] == '0'
            flag = false
            break
          end
        end

        # check i to (i + len)th row on (j + len)th col
        i.upto(i + len).each do |k|
          if matrix[k][j + len] == '0'
            flag = false
            break
          end
        end

        len += 1 if flag
      end
      max_len = len if len > max_len
    end
  end
  max_len * max_len
end

# f(i, j) = max length square that would end in cell (i, j)
#
# f(i, j) = min(f(i-1, j), f(i, j-1), f(i-1, j-1)) if matrix[i][j] == 1
#         = else 0
# basically we need the square above, left and above left to have all 1's to have current big square have all 1's
#
# Complexity: O(n^2)
def maximal_square_dp(matrix)
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