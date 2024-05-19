# @param {Integer} hour
# @param {Integer} minutes
# @return {Float}
def angle_clock(hour, minutes)
  min_angle = minutes * 6 # (min / 60) * 360 => in reference to 12
  hr_angle = hour == 12 ? 0 : hour * 30 # (hr / 12) * 360
  hr_angle += minutes / 2.0 # (min / 60) * (360 / 12)
  ans = (hr_angle - min_angle).abs
  ans < 180 ? ans : 360 - ans
end