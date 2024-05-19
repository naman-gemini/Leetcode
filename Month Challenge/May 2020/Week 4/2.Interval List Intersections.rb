# @param {Integer[][]} a
# @param {Integer[][]} b
# @return {Integer[][]}
def interval_intersection(a, b)
  ans = []
  i, j = 0, 0

  while i < a.size && j < b.size
    a_start, a_end = a[i]
    b_start, b_end = b[j]

    ans_start = [a_start, b_start].max
    ans_end = [a_end, b_end].min

    ans << [ans_start, ans_end] if ans_start <= ans_end

    if a_end < b_end
      i += 1
    else
      j += 1
    end
  end

  ans
end