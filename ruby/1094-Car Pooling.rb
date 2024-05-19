# @param {Integer[][]} trips
# @param {Integer} capacity
# @return {Boolean}
#
# Algorithm: Maximum overlaps in a time range (similar)
#
def car_pooling(trips, capacity)
	arr = []
  trips.each do |trip|
  	return false if trip[0] > capacity
  	arr << [trip[1], 'y', trip[0]]
  	arr << [trip[2], 'x', trip[0]]
  end
  arr = arr.sort
  cnt = 0
  arr.each do |val|
  	cnt += val[2] if val[1] == 'y'
  	cnt -= val[2] if val[1] == 'x'
    return false if cnt > capacity
  end

  return true
end