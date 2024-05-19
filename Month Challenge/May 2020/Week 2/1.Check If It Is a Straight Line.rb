# @param {Integer[][]} coordinates
# @return {Boolean}
def check_straight_line(coordinates)
  slope = nil
  coordinates.sort!

  1.upto(coordinates.size - 1).each do |i|
    c1, c2 = coordinates[i], coordinates[i - 1]
    curr_slope = (c2[1] - c1[1]).to_f / (c2[0] - c1[0]) # m = y2 - y1 / x2 - x1
    if slope
      return false if slope != curr_slope
    else
      slope = curr_slope
    end
  end
  true
end