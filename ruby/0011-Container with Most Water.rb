# @param {Integer[]} height
# @return {Integer}
#
# Algo: We have to select 2 bars. Area of that selection => min height of 2 bars * distance between them
# We can start with left most and right most bar, as they have the max width between them
# Now, we can decide to go right of left or left of right bar. In each case we'll be decreasing width
# We can hope to counter that by increasing the min height, because the area is always constrained by 
# the min height amongst 2 bars. So, whichever is lower, go next from there, hoping we get a bigger
# bar and that increases min height, even though that decreases width. Thus overall *has chance* to 
# increase area.
# O(n) => 1 scan
#
def max_area(height)
  left = 0
  right = height.size - 1
  max_area = 0

  while left < right
    area = [height[left], height[right]].min * (right - left)
    max_area = area if area > max_area
    if height[left] < height[right]
      left += 1
    else
      right -= 1
    end
  end
  max_area
end