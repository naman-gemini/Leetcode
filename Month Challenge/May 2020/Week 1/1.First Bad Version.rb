# The is_bad_version API is already defined for you.
# @param {Integer} version
# @return {boolean} whether the version is bad
# def is_bad_version(version):

# @param {Integer} n
# @return {Integer}
def first_bad_version(n)
  lower_bound(1, n)
end

def lower_bound(lo, hi)
  return -1 if lo > hi

  mid = (lo + hi) / 2
  mid_elem = is_bad_version(mid)
  left_to_mid_elem = is_bad_version(mid - 1) if mid > lo

  if (lo == mid && mid_elem) || (mid_elem && !left_to_mid_elem)
    return mid
  elsif mid_elem # search left
    lower_bound(lo, mid - 1)
  else # search right
    lower_bound(mid + 1, hi)
  end
end