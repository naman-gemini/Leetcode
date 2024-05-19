# @param {Integer[]} citations
# @return {Integer}
def h_index(citations)
  left, right = 0, citations.size - 1
  while left <= right
    mid = (left + right) / 2
    if citations[mid] <= citations.size - mid
      left = mid + 1
    else
      right = mid - 1
    end
  end
  citations.size - left
end