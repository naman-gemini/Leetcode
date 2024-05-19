# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  arr = s.split("")
  sz = arr.size
  return 0 if sz == 0
  max_len = 1
  visited = {}
  i = j = 0
  curr_len = 0
  while (i < sz - 1 && j < sz)
    # already visited
    if visited[arr[j]]
      while (i <= visited[arr[j]].to_i)
        visited[arr[i]] = nil
        i += 1
        curr_len -= 1
      end
    # haven't visited yet
    else
      visited[arr[j]] = j
      curr_len += 1
      j += 1
      max_len = curr_len if curr_len > max_len
    end
  end
  return max_len
end