# @param {Integer[]} cells
# @param {Integer} n
# @return {Integer[]}
#
# There are 2^6 combinitions of cells[1..-2]. There definitely be repetitive pattern sometime.
# After repetition the prison pattern would follow the same chain
#
# require 'Set'
def prison_after_n_days(cells, n)
  res, set = [], Set.new
  count = 0

  while !set.include?(cells[1..-2].join)
    count += 1
    # make modification to prison
    cells_new = cells.dup
    cells_new[0] = 0
    cells_new[-1] = 0

    1.upto(6).each do |i|
      if (cells[i - 1] == 1 && cells[i + 1] == 1) || (cells[i - 1] == 0 && cells[i + 1] == 0)
        cells_new[i] = 1
      else
        cells_new[i] = 0
      end
    end

    set << cells[1..-2].join if count > 1
    res[count - 1] = cells_new

    cells = cells_new
    return cells if count == n
  end

  res.pop # last and first value should be the same (repetition)

  # if it reaches here, means repetition has been found
  res[(n - 1) % res.size]
end

puts prison_after_n_days([1,0,0,1,0,0,1,0], 1000000000).join(',')