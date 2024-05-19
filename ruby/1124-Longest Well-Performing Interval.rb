# @param {Integer[]} hours
# @return {Integer}
def longest_wpi(hours)
  count, ans = 0, 0
  hsh = {} # tracks at which index a count comes at the first time
  hours.each_with_index do |hr, i|
    count += (hr > 8 ? 1 : -1)

    hsh[count] = i unless hsh[count] # if count is not in hash, put it

    if count > 0 # positive count in complete interval
      ans = i + 1
    elsif hsh[count - 1] # look for count - 1 for maximum interval
      ans = [ans, i - hsh[count - 1]].max
    end
  end
  ans
end

puts longest_wpi([8,10,6,16,5])