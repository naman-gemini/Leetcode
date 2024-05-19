# @param {Integer[][]} intervals
# @return {Integer[][]}
#
# After sorting there can be 2 cases amongst consecutive intervals
# Case 1 (overlap):
# ------
#     -------
#
# Case 2 (overlap with prev being max):
# -------
#  ----
#
# Case 3 (no overlap):
# ------
#          ------
#
def merge(intervals)
  ans = []
  intervals.sort!
  intervals.each_with_index do |curr, i|
    ans << curr if i == 0
    prev = ans[-1]
    # there is overlap between interval and last interval
    if prev.last >= curr.first
      ans[-1] = [prev.first, [prev.last, curr.last].max]
    else # no overlap
      ans << curr
    end
  end
  ans
end