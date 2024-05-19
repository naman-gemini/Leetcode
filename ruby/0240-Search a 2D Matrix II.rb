# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
  return false if matrix.empty?

  rows = matrix.size
  cols = matrix[0].size

  row = rows - 1
  col = 0

  while row >= 0 && col < cols
    cell = matrix[row][col]
    if target == cell
      return true
    elsif target > cell # first col can be discarded
      col += 1
    else # last row can be discarded
      row -= 1
    end
  end
  false
end