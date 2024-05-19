# @param {Integer[][]} coordinates
# @return {Boolean}
# Check co-linearity
def check_straight_line(coordinates)
  2.upto(coordinates.size - 1).all? do |i|
    check?(coordinates[0], coordinates[1], coordinates[2])
  end
end

def check?(a, b, c)
  (a[0] - b[0]) * (b[1] - c[1]) == (a[1] - b[1]) * (b[0] - c[0])
end