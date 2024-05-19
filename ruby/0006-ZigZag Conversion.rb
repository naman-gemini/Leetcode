# @param {String} s
# @param {Integer} num_rows
# @return {String}
def convert(s, num_rows)
  # initialize 2D array
  arr = Array.new(num_rows) { Array.new(s.size / 2) }

  idx, row, col = 0, 0, 0

  # fill 2D array
  while idx < s.size
    row = 0
    num_rows.times do
      arr[row][col] = s[idx]
      row += 1
      idx += 1
    end

    row = num_rows - 2
    col += 1
    (num_rows - 2).times do
      arr[row][col] = s[idx]
      row -= 1
      col += 1
      idx += 1
    end
  end

  # read 2D array
  ans = []
  arr.each do |row|
    row.each do |val|
      ans << val if val
    end
  end
  ans.join('')
end