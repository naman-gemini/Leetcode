# @param {Integer[]} nums
# @return {Integer}
def single_non_duplicate(nums)
  lo, hi = 0, nums.size - 1

  while lo < hi
    mid = ( lo + hi ) / 2
    # we always check for even index
    # if the left part (lo..mid) doesn't have single element
    # then mid, mid + 1 should be a repeating pair
    mid -= 1 if mid.odd?

    # if we didn't find a pair, the single element should be on the left
    if nums[mid] != nums[mid + 1]
      hi = mid
    else
      lo = mid + 2
    end
  end

  nums[lo]
end