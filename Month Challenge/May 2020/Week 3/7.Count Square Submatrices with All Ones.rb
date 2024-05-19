# @param {Integer[][]} matrix
# @return {Integer}
def count_squares(matrix)
  return 0 if matrix.empty?

  rows = matrix.size
  cols = matrix[0].size

  ans = 0

  # consider all possible starting points of top left corner
  0.upto(rows - 1).each do |i|
    0.upto(cols - 1).each do |j|
      next if matrix[i][j] == 0

      ans += 1 # square with 1 element

      flag = true
      len = 1 # length of side of square with 1's

      while i + len < rows && j + len < cols && flag
        # NOTE: We've already checked i to (i + len - 1)th row and j to (j + len - 1)th col
        # Basically, in every iteration of a value of len we have to just check 1 row and 1 col
        
        # check j to (j + len)th col on (i + len)th row
        j.upto(j + len).each do |k|
          if matrix[i + len][k] == 0
            flag = false
            break
          end
        end

        # check i to (i + len)th row on (j + len)th col
        i.upto(i + len).each do |k|
          if matrix[k][j + len] == 0
            flag = false
            break
          end
        end

        if flag
          ans += 1
          len += 1
        end
      end
    end
  end
  ans
end