# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def set_zeroes(matrix)
  rows = matrix.size
  cols = matrix[0].size

  # check first row
  first_row = matrix[0].include?(0)
  # check first column
  first_column = matrix.map { |row| row.first }.include?(0)

  # put all zeroes in first row and column
  0.upto(rows - 1).each do |i|
    0.upto(cols - 1).each do |j|
      if matrix[i][j] == 0
        matrix[0][j] = 0
        matrix[i][0] = 0
      end
    end
  end

  # set all zeroes

  # set rows (except first one)
  1.upto(rows - 1).each do |i|
    matrix[i] = [0] * cols if matrix[i][0] == 0
  end

  # set columns
  1.upto(cols - 1).each do |j|
    if matrix[0][j] == 0
      0.upto(rows - 1).each do |i|
        matrix[i][j] = 0
      end
    end
  end

  # set zeroes in first row
  matrix[0] = [0] * cols if first_row

  # set zeroes in first column
  matrix.each { |row| row[0] = 0 } if first_column
end