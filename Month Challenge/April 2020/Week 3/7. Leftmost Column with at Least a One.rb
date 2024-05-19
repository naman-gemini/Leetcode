# """
# This is BinaryMatrix's API interface.
# You should not implement it, or speculate about its implementation
# """
# class BinaryMatrix
#   def get(x, y)
#     @return {Integer}
#   end
#
#   def dimensions()
#     @return {List[Integer]}
#   end
# end

# @param {BinaryMatrix} binaryMatrix
# @return {Integer}
def leftMostColumnWithOne(binaryMatrix)
  m, n = binaryMatrix.dimensions # m rows, n cols
  ans = n

  row, col = 0, n - 1
  while row < m && col >= 0
    val = binaryMatrix.get(row, col)
    if val == 0 # this row is not useful anymore
      row += 1
    else
      ans = col
      col -= 1
    end
  end

  ans == n ? -1 : ans
end


# O(m log n) approach is slow
def leftMostColumnWithOne_slow(binaryMatrix)
  m, n = binaryMatrix.dimensions # m rows, n cols
  ans = n

  0.upto(m - 1).each do |row|
    col = ( ans == n ? lower_bound(binaryMatrix, row, 0, n - 1) : lower_bound(binaryMatrix, row, 0, ans - 1) )
    ans = col if col < ans && col != -1
  end
  ans == n ? -1 : ans
end

def lower_bound(binaryMatrix, row, lo, hi)
  return -1 if lo > hi

  mid = (lo + hi) / 2
  mid_elem = binaryMatrix.get(row, mid)
  left_to_mid = mid - 1 >= 0 ? binaryMatrix.get(row, mid - 1) : nil

  if ( mid_elem == 1 && left_to_mid == 0) || ( lo == mid  && mid_elem == 1 )
    return mid
  end

  if mid_elem == 0 # search in right
    lower_bound(binaryMatrix, row, mid + 1, hi)
  else # search in left
    lower_bound(binaryMatrix, row, lo, mid - 1)
  end

end